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
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.15,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        childAspectRatio: 6,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Humidity",
                style: styleOfText,
              ),
              Text(
                data.main.humidity.toString(),
                style: styleOfNumber,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Feels like",
                style: styleOfText,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    data.main.feelsLike.toStringAsFixed(0),
                    style: styleOfNumber,
                  ),
                  Text(
                    "°C",
                    style: styleOfZnak,
                  )
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Clouds",
                style: styleOfText,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    data.clouds.all.toString(),
                    style: styleOfNumber,
                  ),
                  Text(
                    "%",
                    style: styleOfZnak,
                  ),
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "MinTemp",
                style: styleOfText,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    data.main.tempMin.toStringAsFixed(0),
                    style: styleOfNumber,
                  ),
                  Text(
                    "°C",
                    style: styleOfZnak,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Rain",
                style: styleOfText,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  isRaining(data.rain?.the3H, styleOfNumber),
                  Text(
                    "mm",
                    style: styleOfZnak,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "MaxTemp",
                style: styleOfText,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    data.main.tempMax.toStringAsFixed(0),
                    style: styleOfNumber,
                  ),
                  Text(
                    "°C",
                    style: styleOfZnak,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "PropOfRain",
                style: styleOfText,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    (data.pop * 100).toStringAsFixed(0),
                    style: styleOfNumber,
                  ),
                  Text(
                    "%",
                    style: styleOfZnak,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind",
                style: styleOfText,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    data.wind.speed.toStringAsFixed(1),
                    style: styleOfNumber,
                  ),
                  Text(
                    "m/s",
                    style: styleOfZnak,
                  ),
                ],
              )
            ],
          ),
        ],
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
      style: styleOfNumber,
    );
  }
}
