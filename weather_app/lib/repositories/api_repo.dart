import 'package:dio/dio.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';

class ApiRepo {
  static Future<WeatherData> callApiWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=16,01552&lon=108.212863&appid=${ApiKey.apiKey}',
      );

      final data = res.data;
      print(data);
      return WeatherData.fromMap(data);
    } catch (e) {
      print("Error fetching weather data: $e");
      rethrow;
    }
  }
}
