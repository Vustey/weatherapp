import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/page/detail/widget/detail_body.dart';
import 'package:weather_app/providers/weather_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
        ),
      ),
      child: FutureBuilder(
        future: Future.wait([
          context.read<WeatherProvider>().getWeatherDetail(),
          context.read<WeatherProvider>().getWeatherCurrent(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading weather data',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                'No weather data available',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          // snapshot.data là một List chứa kết quả từ cả hai Future
          List<WeatherDetail> listData =
              snapshot.data![0] as List<WeatherDetail>;
          WeatherData currentWeather =
              snapshot.data![1]
                  as WeatherData; // Giả sử getWeatherCurrent() trả về WeatherData

          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  Icon(Icons.near_me, color: Colors.white),
                  SizedBox(width: 15),
                  Text(
                    currentWeather.name
                        .toUpperCase(), // Lấy tên từ `WeatherData`
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              actions: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 15),
              ],
            ),
            body: DetailBody(listData: listData),
          );
        },
      ),
    );
  }
}
