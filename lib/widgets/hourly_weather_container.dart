import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/background_color.dart';

DateTime dateTime = DateTime.now();

String formattedDate = DateFormat('MMMM d').format(dateTime);
hourlyWeatherWidget({context}) {
  return Container(
    width: 428,
    height: 246,
    decoration: BoxDecoration(
      gradient: gradientBackground,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.transparent),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Today", style: Theme.of(context).textTheme.titleSmall),
            // const Spacer(),
            Text(formattedDate, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        const Divider(
          color: Colors.deepPurple,
        ),
        const Row(
          children: [],
        )
      ],
    ),
  );
}

hourlyForecast() {
  return const Column(
    children: [],
  );
}
