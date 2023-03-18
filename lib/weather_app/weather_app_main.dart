import 'package:flutter/material.dart';
import 'package:testing_cz2/weather_app/weather_class/weather_json_class.dart';
import '../ui/data_under_white_block.dart';
import '../ui/main_view_white_block.dart';
import '../ui/weather_time_day.dart';
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
          Column(
            children: [
              textInputCords(),
              FutureBuilder(
                future: futureData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // MyWeatherClass weatherInfo = snapshot.data;
                  if (snapshot.hasData) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Stack(children: [
                          moreWeatherData(context, snapshot.data),
                          mainWeatherInfo(context, snapshot.data),
                        ]),
                        weatherByTimeAndDay(data: snapshot.data,),
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
              child: whiteMainBlock(blacktext, snapshot, iconLink),
            ),
          ),
        ),
      ),
    );
  }
}
