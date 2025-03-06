import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/api_repo.dart';

class WeatherProvider extends ChangeNotifier {
  Position? position;

  updatePosition(Position positionCurrent) {
    position = positionCurrent;
    notifyListeners();
  }

  Future<WeatherData> getWeatherCurrent() async {
    WeatherData data = await ApiRepo.callApiWeather(position);
    return data;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    List<WeatherDetail> data = await ApiRepo.callApiWeatherDetail(position);
    return data;
  }
}
