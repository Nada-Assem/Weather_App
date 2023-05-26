import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class weather_service {
  weather_model? weather;
  String baseURL = "http://api.weatherapi.com/v1";
  String apiKey = "a0dc93fbda914762984153849230202";
  Future<weather_model?> getweather({required String cityName}) async {
    try {
      Uri url =
          Uri.parse("$baseURL/forecast.json?key=$apiKey&q=$cityName&days=7");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = weather_model.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
