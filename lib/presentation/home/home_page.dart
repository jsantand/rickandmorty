import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examn/data/remote/character_api.dart';
import 'package:flutter_examn/domain/entities/character_entity.dart';
import 'package:flutter_examn/presentation/widgets/card_character.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Character> characterList = [];

  _getCharacterList() async{
    print("entro");
    CharacterApi characterApi = CharacterApi();
    await characterApi.getCharacters();
    setState(() {
      characterList = characterApi.characters;
    });
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCharacterList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: characterList.length == 0 ? Center(
                child: CupertinoActivityIndicator(),
              ):
          ListView.builder(
          itemCount: characterList.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            Character character = characterList[index];
            return CardCharacter(
              character.image,
              character.name,
              character.status,
              character.type
            );
          },
        ),
      ),
    );
  }
}