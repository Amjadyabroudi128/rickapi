import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/Service.dart';

class DetailsPage extends StatelessWidget {
  final Character character;

  const DetailsPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(character.name),
      ),
      body: Center(
        child: Card(
          child: ListView(
            children: [
              Image.network(character.image, fit: BoxFit.fill,),
              SizedBox(height: 14,),
              Row(
                  children: [
                    Text("Name:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    SizedBox(width: 12,),
                    Text(character.name, style: TextStyle(fontSize: 15,),),
                  ],
                ),

              Divider(color: Colors.red,),
              Row(
                children: [
                  Text("Gender:"),
                  SizedBox(width: 15,),
                  Text(character.gender),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
