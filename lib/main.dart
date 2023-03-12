import 'package:flutter/material.dart';
// import 'package:testing_cz2/fetch_json/data_json.dart';
import 'package:testing_cz2/weather_app/weather_app_main.dart';

void main() {
  runApp(const MaterialApp(
    home: WeatherApp(),
    debugShowCheckedModeBanner: false,
    title: "Your Weather",
  ));
}
