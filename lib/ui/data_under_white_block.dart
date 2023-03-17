import 'package:flutter/material.dart';
import 'package:testing_cz2/weather_app/weather_class/weather_json_class.dart';

Widget moreWeatherData(BuildContext context, MyWeatherClass snapshot) {
  TextStyle styleOfText =
      const TextStyle(color: Color(0xfff0f8fc), fontSize: 13.4);
  TextStyle styleOfNumber = const TextStyle(
      color: Color(0xfff0f8fc), fontWeight: FontWeight.w600, fontSize: 16);
  TextStyle styleOfZnak =
      const TextStyle(color: Color(0xfff0f8fc), fontSize: 12);
  const SizedBox space = SizedBox(
    width: 10,
  );
  const SizedBox spaceZnak = SizedBox(
    width: 4,
  );
  ListElement data = snapshot.list[0];

  return Container(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
          color: const Color(0xff007ffc),
          borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.only(top: 240),
      width: MediaQuery.of(context).size.width * 0.70,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Humidity",
                  style: styleOfText,
                ),
                Text(
                  "Clouds",
                  style: styleOfText,
                ),
                Text(
                  "cos",
                  style: styleOfText,
                ),
                Text(
                  "cos",
                  style: styleOfText,
                )
              ],
            ),
            space,
            Column(
              children: [
                Text(
                  data.main.humidity.toString(),
                  style: styleOfNumber,
                ),
                Text(
                  data.clouds.all.toString(),
                  style: styleOfNumber,
                ),
                Text(
                  "cos",
                  style: styleOfNumber,
                ),
                Text(
                  "cos",
                  style: styleOfNumber,
                )
              ],
            )
          ],
        ),
        // child: Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             Text("Humidity", style: styleOfText),
        //             space,
        //             Text(
        //               "${data.main.humidity}",
        //               style: styleOfNumber,
        //             ),
        //             spaceZnak,
        //             Text(
        //               "%",
        //               style: styleOfZnak,
        //             )
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Text(
        //               "Maximum Temperature",
        //               style: styleOfText,
        //             ),
        //             space,
        //             Text(
        //               data.main.tempMax.toStringAsFixed(0),
        //               style: styleOfNumber,
        //             ),
        //             spaceZnak,
        //             Text(
        //               "°C",
        //               style: styleOfZnak,
        //             )
        //           ],
        //         )
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Row(
        //           children: [
        //             Text(
        //               "Clouds",
        //               style: styleOfText,
        //             ),
        //             space,
        //             Text(
        //               data.clouds.all.toString(),
        //               style: styleOfNumber,
        //             ),
        //             spaceZnak,
        //             Text(
        //               "%",
        //               style: styleOfZnak,
        //             )
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Text(
        //               "Raining",
        //               style: styleOfText,
        //             ),
        //             space,
        //             isRaining(data.rain?.the3H, styleOfNumber),
        //             spaceZnak,
        //             Text(
        //               "mm/3h",
        //               style: styleOfZnak,
        //             ),
        //           ],
        //         )
        //       ],
        //     ),
        //   ],
        // ),
      ),
    ),
  );
}

Text isRaining(double? the3h, TextStyle styleOfNumber) {
  if (the3h.toString().isEmpty || the3h == null) {
    return Text(
      "0",
      style: styleOfNumber,
    );
  } else {
    return Text(
      "$the3h",
    );
  }
}
