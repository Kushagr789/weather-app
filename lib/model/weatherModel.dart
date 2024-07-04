

class WeatherModel {
  final String cityName;
  final double temperature;
  final String weatherCondition;
  final String weatherIcon;
  final int humidity;
  final double windSpeed;
  final double realFeel;
  final int pressure;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.weatherIcon,
    required this.humidity,
    required this.windSpeed,
    required this.realFeel,
    required this.pressure,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'],
      weatherCondition: json['weather'][0]['description'],
      weatherIcon: json['weather'][0]['icon'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      realFeel: json['main']['feels_like'],
      pressure: json['main']['pressure']
    );
  }
}
