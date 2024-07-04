// viewmodels/weather_view_model.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/weatherModel.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherModel? weather;
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchWeather(String cityName) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=1befebc0c18af2890ed719c8b680c70d&units=metric'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        weather = WeatherModel.fromJson(json);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('lastSearchedCity', cityName);
      } else {
        errorMessage = 'Failed to fetch weather data';
      }
    } catch (e) {
      errorMessage = 'An error occurred'+e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadLastSearchedCity() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSearchedCity = prefs.getString('lastSearchedCity');
    if (lastSearchedCity != null) {
      await fetchWeather(lastSearchedCity);
    }
  }
}
