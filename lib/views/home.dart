import 'package:flutter/material.dart';
import 'package:weather/widgets/hourly_weather_container.dart';

import '../widgets/background_color.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackground,
        ),
        child: Column(
          children: [
            SizedBox(
              // height: MediaQuery.sizeOf(context).height * 0.6,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/weather.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const Text(
                    '19\u00B0',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 64,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  Text(
                    "Precipitations\nMax 20\u00B0  Min 18",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Center(
                      child: Image.asset(
                    'assets/house.png',
                    height: 198,
                    width: 336,
                  )),
                  hourlyWeatherWidget(context: context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
