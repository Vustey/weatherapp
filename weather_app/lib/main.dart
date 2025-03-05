import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/page/home/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    ),
  );
}