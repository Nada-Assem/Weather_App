import 'package:flutter/material.dart';

class weather_model {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String icon;
  weather_model({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.icon,
  });
  //  Factory constructor
  factory weather_model.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    //print("temp = $jsonData");
    return weather_model(
      date: data["location"]["localtime"],
      temp: jsonData["avgtemp_c"],
      maxTemp: jsonData["maxtemp_c"],
      minTemp: jsonData["mintemp_c"],
      weatherStateName: jsonData["condition"]["text"],
      icon: "https:" + jsonData["condition"]["icon"],
    );
  }
  @override
  String toString() {
    return 'temp = $temp  max = $maxTemp  min= $minTemp';
  }

  MaterialColor? getThemeColor() {
    if (weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      Colors.blueGrey;
    } else if (weatherStateName == 'Partly cloudy') {
      Colors.grey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'heavy Rain' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Moderate rain') {
      return Colors.blue;
    } else {
      return Colors.cyan;
    }
  }
}
