import 'package:flutter/material.dart';
import '../weather_app/weather_class/weather_json_class.dart';
import 'package:flutter_switch/flutter_switch.dart';

class weatherByTimeAndDay extends StatefulWidget {
  const weatherByTimeAndDay({super.key, required this.data});
  final MyWeatherClass data;

  @override
  State<weatherByTimeAndDay> createState() => _weatherByTimeAndDayState();
}

class _weatherByTimeAndDayState extends State<weatherByTimeAndDay> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xff0480f6),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterSwitch(
                    value: state,
                    activeColor: const Color(0xff0660fc),
                    inactiveColor: const Color(0xff0660fc),
                    width: 80,
                    activeText: "24h",
                    inactiveText: "5d",
                    valueFontSize: 14,
                    showOnOff: true,
                    onToggle: (value) {
                      setState(() {
                        state = value;
                      });
                    },
                  ),
                ],
              ),
              changeWeatherList(state),
            ],
          ),
        ),
      ),
    );
  }

  Widget changeWeatherList(bool state) {
    if (state == true) {
      return Center(
        child: Text("test"),
      );
    } else {
      return Center(
        child: Text("test1"),
      );
    }
  }
}
