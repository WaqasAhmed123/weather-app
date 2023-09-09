class WeatherItem {
  Map<String, dynamic> weatherData = {};
  Map<String, dynamic> weatherDescription = {};
  // int? temp;

  // String? city;
  // String? country;

  // final int dt;
  // final MainWeatherData main;
  // final List<WeatherData> weather;
  final String dtTxt;

  WeatherItem({
    // required this.dt,
    required this.weatherData,
    required this.weatherDescription,
    // required this.city,
    // required this.country,
    // required this.sunRise,
    // required this.sunSet,

    required this.dtTxt,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    return WeatherItem(
        weatherData: json["main"],
        weatherDescription: json["weather"][0],
        dtTxt: json["dt_txt"]

        // city: json[["city"][1]],
        // country: json[["city"][3]],
        // sunRise: json[["city"][6]],
        // sunSet: json[["city"][7]],

        //  cityData = json['city'];
        // city = cityData['name'];
        // sunRise = cityData['sunrise'];
        // sunSet = cityData['sunset'];

        // Map the "list" array to weatherData
        //  list = json['list'];
        );
  }
}

class CityInfo {
  String? city;
  String? country;
  int? sunrise;
  int? sunset;
  CityInfo(
      {required this.city,
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory CityInfo.fromJson(Map<String, dynamic> json) {
    return CityInfo(
        city: json["name"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"]);
  }
}
