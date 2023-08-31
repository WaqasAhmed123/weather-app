import 'package:flutter/material.dart';
import 'package:weather/widgets/daily_weather_container.dart';
import 'package:weather/widgets/sun_timing.dart';

import '../widgets/background_color.dart';

class DetailForecastView extends StatefulWidget {
  const DetailForecastView({super.key});

  @override
  State<DetailForecastView> createState() => _DetailForecastState();
}

class _DetailForecastState extends State<DetailForecastView> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    List<Map<String, dynamic>> weatherData = [
      {"day": "Monday", "temp": "25°C", "weather": "Sunny"},
      {"day": "Tuesday", "temp": "23°C", "weather": "Cloudy"},
      {"day": "Wednesday", "temp": "28°C", "weather": "Rainy"},
      {"day": "Thursday", "temp": "26°C", "weather": "Partly Cloudy"},
      {"day": "Friday", "temp": "24°C", "weather": "Windy"},
    ];
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Weather Forecast'),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        margin: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          gradient: gradientBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Karachi',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              // const SizedBox(height: 10),
              Text(
                'Max: ${weatherData[currentIndex]['temp']}  Min: ${weatherData[currentIndex]['temp']}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "5-days Forecasts",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 160, // Set the desired height for the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (currentIndex > 0) {
                                setState(() {
                                  currentIndex--;
                                });
                              }
                            },
                          ),
                          dailyWeatherContainer(
                              temp: "20", day: "Mon", context: context)
                        ],
                      );
                    } else if (index == 5) {
                      debugPrint("executed");
                      return Row(
                        children: [
                          dailyWeatherContainer(
                              temp: "20", day: "Mon", context: context),
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (currentIndex > 0) {
                                setState(() {
                                  currentIndex--;
                                });
                              }
                            },
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          dailyWeatherContainer(
                              temp: "20", day: "Mon", context: context)
                        ],
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  sunTiming(
                      sunEvent: "SUNRISE", time: "5:28", context: context),
                  sunTiming(
                      sunEvent: "SUNSET", time: "7:28", context: context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
