import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static getWeatherData() async {
    var url =
        "https://api.openweathermap.org/data/2.5/forecast?lat=24.893455&lon=67.045637&appid=0a0d1994bc7977871d6922c9b64a439f";
    var response = await http.get(Uri.parse(url));
    final jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
  }
}
