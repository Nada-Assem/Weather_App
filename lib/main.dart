import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/WeatherProvider.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/screens/search_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WheatherProvider();
      },
      child: Weather_App()));
}

class Weather_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        /*scaffoldBackgroundColor:
            Provider.of<WheatherProvider>(context).wheatherData == null
                ? Colors.white
                : Provider.of<WheatherProvider>(context)
                    .wheatherData!
                    .getThemeColor(),*/
        primarySwatch:
            Provider.of<WheatherProvider>(context).wheatherData == null
                ? Colors.blue
                : Provider.of<WheatherProvider>(context)
                    .wheatherData!
                    .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: home_page(),
    );
  }
}
