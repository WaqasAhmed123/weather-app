import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../models/weather_model.dart';

class ApiServices {
  static var url =
      "https://api.openweathermap.org/data/2.5/forecast?lat=${UserModel.lat}&lon=${UserModel.lng}&appid=0a0d1994bc7977871d6922c9b64a439f";

  static Future<Map<String, dynamic>> getWeatherData() async {
    try {
      var response = await http.get(Uri.parse(url));
      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final weatherData = List<WeatherItem>.from(jsonResponse['list'].map(
                (json) => WeatherItem.fromJson(json as Map<String, dynamic>)))
            .toList();
        print(weatherData[1].weatherDescription);

        // for (var item in weatherData) {
        //   // print(weatherData);
        //   print(item.weatherDescription);

        //   // print('Temperature: ${item.weatherData["temp"]}°C');
        //   // print('Dates: ${item.dtTxt}°C');
        // }

        final cityInfo = CityInfo.fromJson(jsonResponse['city']);
        print(cityInfo);

        return {
          "weatherData": weatherData,
          "weatherDescription": weatherData[1].weatherDescription,
          "cityInfo": cityInfo,
        };
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
// }67.045637
// 24.893455