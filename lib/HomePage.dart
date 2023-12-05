import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/Details.dart';
import 'package:rickandmorty/Service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Character>> futureCharacter;
  @override
  void initState() {
    super.initState();
    futureCharacter = CharacterService().getCharacter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("characters"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: FutureBuilder<List<Character>>( future: futureCharacter,
    builder: ( context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return ListView.separated
              (itemBuilder: (context, index) {
                Character character = snapshot.data?[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(character: character,)));
                  },
                  child: Container(
                    width: 200.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                character.image
                            ),
                            fit: BoxFit.cover
                        ),
                    ),
                  ),
                );
            },
                separatorBuilder
                    : (context, index){
                  return Divider(color: Colors.black26,);
                },
                itemCount: snapshot.data.length);
    } else if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }
          return const CircularProgressIndicator();
    },
      ),
    )
    );
  }
}