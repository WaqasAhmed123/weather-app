import 'package:flutter/material.dart';
import 'package:weather/services/api_services.dart';

class HomeViewModel extends ChangeNotifier {
  bool dataFetched = false;
  String? currentTemp;
  String? minTemp;
  String? maxTemp;
  String? feelsLike;
  String? weatherDescription;
  String? weatherDescriptionIconUrl;
  List<int> dailyWiseTemp = [];
  // List<WeatherItem> weatherData = [];
  fetchCompleteData() async {
    final completeWeatherData = await ApiServices.getWeatherData();
    final weatherData = completeWeatherData['weatherData'];
    weatherDescription =
        completeWeatherData['weatherDescription']['description'];
    weatherDescriptionIconUrl =
        "http://openweathermap.org/img/w/${completeWeatherData['weatherDescription']['icon']}.png";
    print(weatherDescription);
    print(weatherDescriptionIconUrl);

    calculateDailyAverages(weatherData: weatherData);
    currentTemp =
        (weatherData[0].weatherData['temp'] - 273.15).toStringAsFixed(0);
    minTemp =
        (weatherData[0].weatherData['temp_min'] - 273.15).toStringAsFixed(0);
    maxTemp =
        (weatherData[0].weatherData['temp_max'] - 273.15).toStringAsFixed(0);
    feelsLike =
        (weatherData[0].weatherData["feels_like"] - 273.15).toStringAsFixed(0);
    dataFetched = true;
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
