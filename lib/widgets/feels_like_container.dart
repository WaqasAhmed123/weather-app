import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/background_color.dart';

import '../views/detail_forecast.dart';

DateTime dateTime = DateTime.now();

String formattedDate = DateFormat('MMMM d').format(dateTime);
Widget feelsLikeContainerWidget({context, feelsLike}) {
  return Container(
    // width: 428,
    // height: 246,
    // height: 150,
    decoration: BoxDecoration(
      gradient: gradientBackground,
      border: Border.all(color: Colors.transparent),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
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
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Feels Like',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    feelsLike,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailForecastView()),
                        );
                      },
                      child: Text(
                        'See More',
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                ],
              ),

              // hourlyForecast(hour: 16, temp: 20,context: context),
              // hourlyForecast(hour: 16, temp: 20,context: context),
              // hourlyForecast(hour: 16, temp: 20,context: context),
              // hourlyForecast(hour: 16, temp: 20,context: context),
            ],
          ),
        )
      ],
    ),
  );
}

// Widget hourlyForecast({temp, hour,context}) {
//   return Column(
//     children: [
//       Text("$temp",style:Theme.of(context).textTheme.bodyLarge),
//       Image.asset('assets/weather.png',height: 20,width: 20,),
//       Text("$hour",style:Theme.of(context).textTheme.bodyLarge),
//     ],
//   );
// }
