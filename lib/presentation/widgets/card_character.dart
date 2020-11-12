import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCharacter extends StatelessWidget {
  final String urlImage, name, status, type;
  const CardCharacter(this.urlImage, this.name, this.status, this.type);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  urlImage,
                  fit: BoxFit.cover,
                  width: 70,
                  height: 70,
                ),
              ),
              SizedBox(width:10),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name),
                SizedBox(height:10),
                Text(status),
              ],
            ),
          ],
        ),
      ),
    );
  }
}