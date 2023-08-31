import 'package:flutter/material.dart';
import 'package:weather/views/detail_forecast.dart';
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
                  hourlyWeatherWidget(context: context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DetailForecastView()),
                          );
                        },
                        icon: const Icon(Icons.location_on,
                            color: Colors.white, size: 30),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline,
                            color: Colors.white, size: 30),
                      ),
                    ],
                  )
                  //             BottomNavigationBar(
                  //   // currentIndex: _currentIndex,
                  //   currentIndex: 0,
                  //   // onTap: _onTabTapped,
                  //   // onTap:()=>Null,
                  //   items: const [
                  //     BottomNavigationBarItem(
                  //       icon: Icon(Icons.location_on),
                  //       label: 'Location',
                  //     ),
                  //     BottomNavigationBarItem(
                  //       icon: Icon(Icons.add),
                  //       label: 'Add',
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
