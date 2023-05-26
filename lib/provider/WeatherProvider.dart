import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WheatherProvider extends ChangeNotifier {
  weather_model? _wheatherData;
  String? cityName;
  set wheatherData(weather_model? weather) {
    _wheatherData = weather;
    notifyListeners();
  }

  weather_model? get wheatherData => _wheatherData;
}
