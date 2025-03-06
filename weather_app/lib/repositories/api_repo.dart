import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';

class ApiRepo {
  static Future<WeatherData> callApiWeather(Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position?.latitude}&lon=${position?.longitude}&appid=${ApiKey.apiKey}&units=metric&lang=vi',
      );

      final data = res.data;
      print(data);
      return WeatherData.fromMap(data);
    } catch (e) {
      print("Error fetching weather data: $e");
      rethrow;
    }
  }

  static Future<List<WeatherDetail>> callApiWeatherDetail(Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast?lat=16.01552&lon=108.212863&appid=${ApiKey.apiKey}&units=metric&lang=vi',
      );

      if (res.statusCode == 200) {
        List data = res.data['list'];
        return List<WeatherDetail>.from(
          data.map((e) => WeatherDetail.fromMap(e)),
        );
      } else {
        throw Exception("Lỗi API: ${res.statusCode} - ${res.statusMessage}");
      }
    } catch (e) {
      print("Error fetching weather data: $e");
      rethrow;
    }
  }
}
