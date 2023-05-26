import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/WeatherProvider.dart';
import 'package:weather_app/screens/search_page.dart';

class home_page extends StatefulWidget {
  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  void updataUp() {
    setState(() {});
  }

  weather_model? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WheatherProvider>(context).wheatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (Context) {
                      return search_page(
                        updataUp: updataUp,
                      );
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: weatherData == null
          ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    //Colors.orange,
                    Provider.of<WheatherProvider>(context)
                        .wheatherData!
                        .getThemeColor()!,
                    Colors.white60,
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WheatherProvider>(context).cityName!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherData!.date,
                    //"Updated at : ${weatherData!.date.hour.toString()} : ${weatherData!.minute.toString()} ",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(weatherData!.icon),
                      Text(
                        " ${weatherData!.temp.toInt()} ",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text("maxTemp : ${weatherData!.maxTemp.toInt()}"),
                          Text("minTemp : ${weatherData!.minTemp.toInt()}"),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData!.weatherStateName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
    );
  }
}
