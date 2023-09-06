import 'package:flutter/material.dart';
import 'package:weather/services/api_services.dart';

class HomeViewModel extends ChangeNotifier {
  bool dataFetched = false;
  String? currentTemp;
  String? minTemp;
  String? maxTemp;
  String? weatherDescription;
  String? weatherDescriptionIcon;
  List<int> dailyWiseTemp = [];
  // List<WeatherItem> weatherData = [];
  fetchCompleteData() async {
    final completeWeatherData = await ApiServices.getWeatherData();
    final weatherData = completeWeatherData['weatherData'];
    weatherDescription = weatherData[1].weatherData['description'];
    weatherDescriptionIcon = weatherData[1].weatherData['icon'];
    // print(weatherDescription);
    // print(weatherDescriptionIcon);

    calculateDailyAverages(weatherData: weatherData);
    final currentTemperatureKelvin = weatherData[0].weatherData['temp'];
    final minTemperatureKelvin = weatherData[0].weatherData['temp_min'];
    final maxTemperatureKelvin = weatherData[0].weatherData['temp_max'];
    currentTemp = (currentTemperatureKelvin - 273.15).toStringAsFixed(0);
    minTemp = (minTemperatureKelvin - 273.15).toStringAsFixed(0);
    maxTemp = (maxTemperatureKelvin - 273.15).toStringAsFixed(0);
    dataFetched = true;
    print("---------------------");
    print(dailyWiseTemp);
    notifyListeners();
  }

  void calculateDailyAverages({weatherData}) {
    // Clear the existing dailyWiseTemp list

    // Group hourly data by date
    final Map<String, List<double>> dailyTemperatureMap = {};

    for (var item in weatherData) {
      final date = item.dtTxt.split(' ')[0];
      final temperatureKelvin = item.weatherData['temp'];
      final temperatureCelsius = temperatureKelvin - 273.15;

      if (!dailyTemperatureMap.containsKey(date)) {
        dailyTemperatureMap[date] = [];
      }

      dailyTemperatureMap[date]!.add(temperatureCelsius);
    }

    // Calculate daily averages and add to the dailyWiseTemp list
    dailyTemperatureMap.forEach((date, temperatures) {
      final averageTemperature =
          temperatures.reduce((a, b) => a + b) / temperatures.length;
      dailyWiseTemp.add(averageTemperature.round());
    });
  }

  // int _currentIndex = 0;

  // void _onTabTapped(int index) {
  //   _currentIndex = index;
  // }
}
