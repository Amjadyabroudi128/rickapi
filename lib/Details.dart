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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(character.name),
              ),
              Divider(color: Colors.red,)
            ],
          ),
        ),
      ),
    );
  }
}
