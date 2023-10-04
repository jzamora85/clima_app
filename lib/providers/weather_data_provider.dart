import 'package:clima_app/models/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherDataNotifier =
    ChangeNotifierProvider((ref) => WeatherDataProvider());

class WeatherDataProvider extends ChangeNotifier {
  WeatherData weatherData = WeatherData(
      latitude: 0,
      longitude: 0,
      generationtimeMs: 0,
      utcOffsetSeconds: 0,
      timezone: "",
      timezoneAbbreviation: "",
      elevation: 0,
      currentWeather: CurrentWeather(
          temperature: 0,
          windspeed: 0,
          winddirection: 0,
          weathercode: 0,
          isDay: 0,
          time: ""),
      hourlyUnits: HourlyUnits(
          time: "",
          temperature2M: "",
          relativehumidity2M: "",
          windspeed10M: ""),
      hourly: Hourly(
          time: [],
          temperature2M: [],
          relativehumidity2M: [],
          windspeed10M: []));
  setWeatherData(WeatherData data) {
    weatherData = data;
    notifyListeners();
  }
}
