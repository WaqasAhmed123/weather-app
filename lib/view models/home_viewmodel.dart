import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/services/api_services.dart';

class HomeViewModel extends ChangeNotifier {
  bool dataFetched = false;
  String? currentTemp;
  String? minTemp;
  String? maxTemp;
  String? feelsLike;
  String? weatherDescription;
  String? weatherDescriptionIconUrl;
  String? city;
  String? country;
  String? sunrise;
  String? sunset;
  final List<List<dynamic>> dayWiseTemp = [];

  fetchCompleteData() async {
    final completeWeatherData = await ApiServices.getWeatherData();
    final weatherData = completeWeatherData['weatherData'];
    final cityData = completeWeatherData['cityInfo'];
    city = cityData.city;
    country = cityData.country;
    sunrise = formatTimestampTo12HourFormat(cityData.sunrise).toString();
    sunset = formatTimestampTo12HourFormat(cityData.sunset).toString();
    // sunRise = cityData.sunrise;
    // sunSet = cityData.sunset;
    // print(detailForecastViewModel.city);
    // print(detailForecastViewModel.country);
    // print(detailForecastViewModel.sunRise);
    // print(detailForecastViewModel.sunSet);
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

    // Calculate daily averages and add to the dayWiseTempList
    dailyTemperatureMap.forEach((date, temperatures) {
      final dateTime = DateTime.parse(date);
      final dayAbbreviation = DateFormat.E('en_US').format(dateTime);

      final averageTemperature =
          temperatures.reduce((a, b) => a + b) / temperatures.length;

      dayWiseTemp.add([dayAbbreviation, averageTemperature.round()]);
    });
  }

  String formatTimestampTo12HourFormat(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final formattedTime =
        DateFormat('h:mm a').format(dateTime); // 'h:mm a' for 12-hour format
    return formattedTime;
  }
}
