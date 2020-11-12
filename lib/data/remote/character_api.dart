import 'dart:convert';
import 'package:flutter_examn/domain/entities/character_entity.dart';
import 'package:http/http.dart' as http;

class CharacterApi {
  List<Character> characters = [];

  Future<void> getCharacters() async {
    String url =
        'https://rickandmortyapi.com/api/character/';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
      print(jsonData["results"].length);
      jsonData["results"].forEach((element) {
        if (element['id'] != null) {
          Character character = Character(
            element['id'],
            element['name'],
            element['status'], 
            element['species'],
            element['type'],
            element['gender'],
            element['image'], 
            element['url'],
          );
          characters.add(character);
        }
      });
  }
}