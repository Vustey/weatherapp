import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/page/bottom_navigation_custom/bottom_custom.dart';
import 'package:weather_app/providers/weather_provider.dart';

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  return await Geolocator.getCurrentPosition();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Position positionCuurrent;
  positionCuurrent = await _determinePosition();
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider()..updatePosition(positionCuurrent),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigationCustom(),
      ),
    ),
  );
}
