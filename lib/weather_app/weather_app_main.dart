import 'package:flutter/material.dart';
import 'package:testing_cz2/weather_app/weather_class/weather_json_class.dart';
import 'network_fetch/fetch_data.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Future<MyWeatherClass>? futureData;
  String cityName = "London";
  final Color lightBlue = const Color(0xff3e95fe);
  final Color deepBlue = const Color(0xff0660fc);
  double lat = 15;
  double lon = 13;

  @override
  void initState() {
    super.initState();
    futureData = Network().fetchData(name: cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepBlue,
      body: ListView(
        children: [
          textInputCords(),
          FutureBuilder(
            future: futureData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // MyWeatherClass weatherInfo = snapshot.data;
              if (snapshot.hasData) {
                return Column(
                  children: [
                    mainWeatherInfo(context, snapshot.data),
                  ],
                );
              } else if (snapshot.hasError) {
                throw Exception(snapshot.error);
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  Widget textInputCords() {
    const Color lightBlue = Color(0xff3e95fe);

    const TextStyle inputStyle = TextStyle(
        color: Color.fromARGB(240, 255, 255, 255),
        fontFamily: "Montserrat",
        fontSize: 15);

    const InputDecoration inputDecLen = InputDecoration(
      hintText: 'City',
      border: InputBorder.none,
      filled: true,
      fillColor: lightBlue,
      hintStyle: TextStyle(color: Colors.white60),
    );

    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Enter the city!",
                style: TextStyle(
                    color: Color.fromARGB(240, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: TextField(
                        keyboardType: TextInputType.name,
                        onSubmitted: (value) {
                          setState(() {
                            cityName = value;
                            futureData = Network().fetchData(name: cityName);
                          });
                          // print(lat);
                        },
                        style: inputStyle,
                        decoration: inputDecLen),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget mainWeatherInfo(BuildContext context, MyWeatherClass snapshot) {
    Color blacktext = const Color(0xff273438).withAlpha(200);
    String iconLink =
        (snapshot.list[0].weather[0].icon).replaceAll(RegExp(r'n'), 'd');

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Align(
        child: SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Card(
            color: const Color(0xffd0edf8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(30)),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50, top: 20),
                              child: Text(
                                "${snapshot.list[0].main.temp.toStringAsFixed(0)}",
                                style: TextStyle(
                                    fontSize: 75,
                                    fontWeight: FontWeight.bold,
                                    color: blacktext.withAlpha(240)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Image.network(
                            "http://openweathermap.org/img/wn/$iconLink@2x.png",
                            width: 200,
                            // height: 250,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 20, horizontal: 50),
                  //     child: Text(
                  //       "°C",
                  //       style: TextStyle(
                  //           color: blacktext,
                  //           fontSize: 25,
                  //           fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
