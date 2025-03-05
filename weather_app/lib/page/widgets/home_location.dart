import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLocation extends StatelessWidget {
  const HomeLocation({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icons/location.png'),
            SizedBox(width: 10),
            Text(
              name.toUpperCase(),
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 17),
        Text(
          DateFormat('dd-MM-yyyy').format(DateTime.now()),
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ],
    );
  }
}
