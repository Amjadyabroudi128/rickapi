import 'package:http/http.dart' as http;
import 'dart:convert';
class Character {
  var id;
  String name;
  String status;
  String species;
  String gender;
  String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });
  factory Character.fromJson(Map<String, dynamic> json ) {
    return Character(id: json["id"],
      image: json["image"],
      gender: json["gender"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
    );
  }
}
class CharacterService {
  Future<List<Character>> getCharacter() async {
    final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));
    if (response.statusCode ==200) {
      final data = jsonDecode(response.body);
      final List <Character> list = [];
      for (var  i = 0; i < data ['results'].length; i++){
        final entry = data ['results'][i];
        list.add(Character.fromJson(entry));
      }
      return list;
    } else {
      throw Exception('failed');
    }
  }
}