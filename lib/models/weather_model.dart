class WeatherItem {
  final int dt;
  final MainWeatherData main;
  final List<WeatherData> weather;
  final String dtTxt;

  WeatherItem({
    required this.dt,
    required this.main,
    required this.weather,
    required this.dtTxt,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    return WeatherItem(
      dt: json['dt'],
      main: MainWeatherData.fromJson(json['main']),
      weather: List<WeatherData>.from(json['weather'].map((w) => WeatherData.fromJson(w))),
      dtTxt: json['dt_txt'],
    );
  }
}

class MainWeatherData {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  MainWeatherData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
  });

  factory MainWeatherData.fromJson(Map<String, dynamic> json) {
    return MainWeatherData(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
    );
  }
}

class WeatherData {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherData({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
