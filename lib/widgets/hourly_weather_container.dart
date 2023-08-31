import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/background_color.dart';

DateTime dateTime = DateTime.now();

String formattedDate = DateFormat('MMMM d').format(dateTime);
Widget hourlyWeatherWidget({context}) {
  return Container(
    width: 428,
    // height: 246,
    height: 200,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              hourlyForecast(hour: 16, temp: 20,context: context),
              hourlyForecast(hour: 16, temp: 20,context: context),
              hourlyForecast(hour: 16, temp: 20,context: context),
              hourlyForecast(hour: 16, temp: 20,context: context),
            ],
          ),
        )
      ],
    ),
  );
}

Widget hourlyForecast({temp, hour,context}) {
  return Column(
    children: [
      Text("$temp",style:Theme.of(context).textTheme.bodyLarge),
      Image.asset('assets/weather.png',height: 20,width: 20,),
      Text("$hour",style:Theme.of(context).textTheme.bodyLarge),
    ],
  );
}
