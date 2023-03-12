import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testing_cz2/weather_app/weather_class/weather_json_class.dart';

class Network {
  Future<MyWeatherClass> fetchData({required String name}) async {
    // var link =
    //     "http://api.openweathermap.org/data/2.5/forecast?q=$lat&units=metric&appid=b919d40ede2a4ef309dc3fd74d6fef94";
    final response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/forecast?q=$name&units=metric&appid=b919d40ede2a4ef309dc3fd74d6fef94"));

    if (response.statusCode == 200) {
      // List<dynamic> jsonResponse = jsonDecode(response.body);
      // return jsonResponse.map((e) => MyWeatherClass.fromJson(e)).toList();
      // return MyWeatherClass.fromJson(json.decode(response.body));
      return MyWeatherClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Błąd w załadowaniu z pliku json");
    }
  }
}
