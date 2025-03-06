import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const linkAsset = 'assets/images/weathers/';

class AssetCustom {
  static String getLinkImg(String name) =>
      '$linkAsset${name.replaceAll('', '').toLowerCase()}.png';
}

class ApiKey {
  static const String apiKey = '6d6377a3b5e18211b7944d1937fcdfe4';
}

Widget createTemp(num temp, {double size = 100}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        (temp).toStringAsFixed(0),
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        '0',
        style: TextStyle(
          fontSize: size / 3,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );
}
