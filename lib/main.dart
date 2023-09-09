import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/user_model.dart';
import 'package:weather/view%20models/detail_forecast_viewmodel.dart';
import 'package:weather/view%20models/home_viewmodel.dart';
import 'package:weather/views/detail_forecast.dart';
import 'package:weather/views/home.dart';
import 'package:weather/views/start.dart';

void main() async {
  // int timestamp = 1693591200;
  // DateTime dt =
  //     DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);

  // print(dt.toLocal());
  WidgetsFlutterBinding.ensureInitialized();
  await UserModel.getCurrentLocation();
  // await ApiServices.getWeatherData();
  // print(WeatherItem);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
            create: (context) => HomeViewModel()),
        Provider(create: (context) => const HomeView()),
        ChangeNotifierProvider<DetailForecastViewModel>(
            create: (context) => DetailForecastViewModel()),
        Provider(create: (context) => const DetailForecastView()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
//         LinearGradient gradient = LinearGradient(
//   colors: [Colors.red, Colors.blue],
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
// ),
        scaffoldBackgroundColor: const Color(0xFF362A84),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.white),
          titleSmall: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          bodyLarge: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartView(),
    );
  }
}
