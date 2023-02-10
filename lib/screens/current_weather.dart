import 'package:flutter/material.dart';

Widget CurrentWeather(IconData icon, String temp, String location) {
  return Center(
    child: Column(
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 64.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '$temp',
          style: TextStyle(
            fontSize: 46.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '$location',
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF5a5a5a),
          ),
        )
      ],
    ),
  );
}
