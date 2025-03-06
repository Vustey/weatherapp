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
        future: context.read<WeatherProvider>().getWeatherDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  Icon(Icons.near_me, color: Colors.white),
                  SizedBox(width: 15),
                  Text(
                    "HO CHI MINH City",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              actions: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 15),
              ],
            ),
            body: DetailBody(
              listData: listData,
            ),
          );
        },
      ),
    );
  }
}
