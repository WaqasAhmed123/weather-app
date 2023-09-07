import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/views/detail_forecast.dart';
import 'package:weather/view models/home_viewmodel.dart';
import 'package:weather/widgets/feels_like_container.dart';

import '../widgets/background_color.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Access the HomeViewModel instance from the Provider
    HomeViewModel instance = Provider.of<HomeViewModel>(context, listen: false);
    instance.fetchCompleteData();
    print("fetching");
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: gradientBackground,
          ),
          child: Consumer<HomeViewModel>(
            builder: (context, value, child) {
              if (homeViewModel.dataFetched == false) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    SizedBox(
                      // height: MediaQuery.sizeOf(context).height * 0.6,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Center(
                                child: Image.network(
                              homeViewModel.weatherDescriptionIconUrl!,
                              fit: BoxFit.cover,
                              // scale: 100,
                              //  Image.asset(
                              //   'assets/weather.png',
                              height: 150,
                              width: 150,
                            )
                                // ),
                                ),
                          ),
                          // FutureBuilder(
                          //   future: ApiServices.getWeatherData(),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.hasData) {
                          //       final weatherData = snapshot.data!['weatherData'];
                          //       final temperatureKelvin =
                          //           weatherData[0].weatherData['temp'];
                          //       final temperatureCelsius =
                          //           (temperatureKelvin - 273.15).toStringAsFixed(0);
                          // return
                          // Consumer<HomeViewModel>(builder: (
                          //   context,
                          //   value,
                          //   child,
                          // ) {
                          //   debugPrint("rebuilded");
                          Text(
                            // '19\u00B0',
                            '${homeViewModel.currentTemp}\u00B0C',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 64,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                          // }),
                          //     }
                          //     if (snapshot.connectionState == ConnectionState.waiting) {
                          //       return const CircularProgressIndicator();
                          //     }
                          //     return const CircularProgressIndicator();
                          //   },
                          //   // child:
                          // ),
                          Center(
                            child: Text(
                              "${homeViewModel.weatherDescription}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Max ${homeViewModel.maxTemp}\u00B0  Min ${homeViewModel.minTemp}\u00B0",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                              child: Image.asset(
                            'assets/house.png',
                            height: 198,
                            width: 336,
                          )),

                          feelsLikeContainerWidget(
                              context: context,
                              feelsLike: "${homeViewModel.feelsLike}\u00B0"),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) =>
                          //                   const DetailForecastView()),
                          //         );
                          //       },
                          //       icon: const Icon(Icons.location_on,
                          //           color: Colors.white, size: 30),
                          //     ),
                          //     IconButton(
                          //       onPressed: () {
                          //         // homeViewModel.fetchCompleteData(setTemp: "28");
                          //       },
                          //       icon: const Icon(Icons.add_circle_outline,
                          //           color: Colors.white, size: 30),
                          //     ),
                          //   ],
                          // )
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
                );
              }
              // homeViewModel.dataFetched == false
              //     ?
              // :
            },
          )),
    );
  }
}
