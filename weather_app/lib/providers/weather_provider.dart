import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/api_repo.dart';

class WeatherProvider extends ChangeNotifier {
  Future<WeatherData> getWeatherCurrent() async {
    WeatherData data = await ApiRepo.callApiWeather();
    return data;
  }
}
