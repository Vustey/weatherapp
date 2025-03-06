import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  const HomeDetailWeather({super.key, required this.speed, required this.deg});

  final num speed, deg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/humidity.png', fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              "${deg}%",
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/Vector.png', fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              "${speed}km/h",
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
