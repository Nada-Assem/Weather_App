import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/WeatherProvider.dart';
import 'package:weather_app/services/weather_service.dart';

class search_page extends StatelessWidget {
  String? cityName;
  VoidCallback? updataUp;
  search_page({required this.updataUp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: TextField(
            onChanged: (data) async {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              weather_service service = weather_service();
              weather_model? weather =
                  await service.getweather(cityName: cityName!);
              Provider.of<WheatherProvider>(context, listen: false)
                  .wheatherData = weather;
              Provider.of<WheatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 30),
              hintText: "Enter a City",
              label: Text("Search"),
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    weather_service service = weather_service();
                    weather_model? weather =
                        await service.getweather(cityName: cityName!);
                    Provider.of<WheatherProvider>(context, listen: false)
                        .wheatherData = weather;
                    Provider.of<WheatherProvider>(context, listen: false)
                        .cityName = cityName;
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
