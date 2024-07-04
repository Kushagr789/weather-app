import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

class GetWeatherType{
  static WeatherType getWeatherType(String main) {
    switch (main) {
      case 'clear':
        return WeatherType.sunny;
      case 'clouds':
        return WeatherType.cloudy;
      case 'rain':
        return WeatherType.lightRainy;
      case 'thunderstorm':
        return WeatherType.thunder;
      case 'snow':
        return WeatherType.heavySnow;
      case 'mist':
      case 'fog':
        return WeatherType.foggy;
      default:
        return WeatherType.sunny;
    }
  }
}