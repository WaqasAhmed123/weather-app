import 'package:flutter/material.dart';

import 'background_color.dart';

Widget dailyWeatherContainer({temp, day, context}) {
  return Container(
    width: 82,
    height: 172,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      gradient: gradientBackground,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.transparent),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(temp, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 5),
        const Icon(Icons.wb_sunny,color: Colors.white,size: 40),
        const SizedBox(height: 5),
        // Text(weatherData[index]['temp']),
        Text(day, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 5),
        // Text(weatherData[index]['weather']),
      ],
    ),
  );
}
