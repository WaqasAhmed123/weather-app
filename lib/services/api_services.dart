import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../models/weather_model.dart';

class ApiServices {
  static getWeatherData() async {
    var url =
        "https://api.openweathermap.org/data/2.5/forecast?lat=${UserModel.lat}&lon=${UserModel.lng}&appid=0a0d1994bc7977871d6922c9b64a439f";
    var response = await http.get(Uri.parse(url));
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // final jsonResponse = jsonDecode(response.body);
      // final data = WeatherItem.fromJson(jsonResponse);
      // print(data);
      // return WeatherItem.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
// }67.045637
// 24.893455