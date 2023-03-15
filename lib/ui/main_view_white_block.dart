import 'package:flutter/material.dart';
import '../weather_app/weather_class/weather_json_class.dart';

Widget whiteMainBlock(
    Color blacktext, MyWeatherClass snapshot, String iconLink) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.near_me,
                  color: blacktext,
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${snapshot.city.name}, ${snapshot.city.country}",
                  style: TextStyle(color: blacktext),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 20),
            child: Icon(
              Icons.settings,
              color: blacktext,
              size: 22,
            ),
          ),
        ],
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: RichText(
                      text: TextSpan(
                          text: snapshot.list[0].main.temp.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 95,
                            fontWeight: FontWeight.bold,
                            color: blacktext.withAlpha(240),
                          ),
                          children: [
                            TextSpan(
                                text: '°C',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: blacktext,
                                  textBaseline: TextBaseline.ideographic,
                                )),
                          ]),
                    ),
                  ),
                )),
            Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.network(
                  "http://openweathermap.org/img/wn/$iconLink@2x.png",
                  width: 180,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
