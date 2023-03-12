import 'dart:convert';
import 'package:http/http.dart' as http;

class RandomJoke {
  RandomJoke({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  String type;
  String setup;
  String punchline;
  int id;

  factory RandomJoke.fromJson(Map<String, dynamic> json) => RandomJoke(
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "setup": setup,
        "punchline": punchline,
        "id": id,
      };
}

Future<List<RandomJoke>> fetchData() async {
  final response = await http
      .get(Uri.parse("https://official-joke-api.appspot.com/random_ten"));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((e) => RandomJoke.fromJson(e)).toList();
  } else {
    throw Exception("Błąd");
  }
}
