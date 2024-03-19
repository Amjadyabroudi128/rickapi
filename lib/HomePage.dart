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
            return GridView.builder(

              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Character character = snapshot.data?[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(character: character,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 300.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                character.image
                              ),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                                  Positioned(
                                    bottom: 1,
                                    right: 1,
                                    left: 1,
                                    child: Container(
                                      width: 90,
                                      height: 30,
                                      color: Colors.black38,
                                      child: Center(child: Text(character.name, style: TextStyle(color: Colors.white),)),
                                    ),
                                  )
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 200,
            ),
            );
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
