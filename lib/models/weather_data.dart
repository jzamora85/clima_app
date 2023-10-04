// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'dart:convert';

WeatherData weatherDataFromJson(String str) => WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
    double latitude;
    double longitude;
    double generationtimeMs;
    int utcOffsetSeconds;
    String timezone;
    String timezoneAbbreviation;
    int elevation;
    CurrentWeather currentWeather;
    HourlyUnits hourlyUnits;
    Hourly hourly;

    WeatherData({
        required this.latitude,
        required this.longitude,
        required this.generationtimeMs,
        required this.utcOffsetSeconds,
        required this.timezone,
        required this.timezoneAbbreviation,
        required this.elevation,
        required this.currentWeather,
        required this.hourlyUnits,
        required this.hourly,
    });

    factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentWeather: CurrentWeather.fromJson(json["current_weather"]),
        hourlyUnits: HourlyUnits.fromJson(json["hourly_units"]),
        hourly: Hourly.fromJson(json["hourly"]),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_weather": currentWeather.toJson(),
        "hourly_units": hourlyUnits.toJson(),
        "hourly": hourly.toJson(),
    };
}

class CurrentWeather {
    double temperature;
    double windspeed;
    int winddirection;
    int weathercode;
    int isDay;
    String time;

    CurrentWeather({
        required this.temperature,
        required this.windspeed,
        required this.winddirection,
        required this.weathercode,
        required this.isDay,
        required this.time,
    });

    factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        temperature: json["temperature"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddirection: json["winddirection"],
        weathercode: json["weathercode"],
        isDay: json["is_day"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "weathercode": weathercode,
        "is_day": isDay,
        "time": time,
    };
}

class Hourly {
    List<String> time;
    List<double> temperature2M;
    List<int> relativehumidity2M;
    List<double> windspeed10M;

    Hourly({
        required this.time,
        required this.temperature2M,
        required this.relativehumidity2M,
        required this.windspeed10M,
    });

    factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M: List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        relativehumidity2M: List<int>.from(json["relativehumidity_2m"].map((x) => x)),
        windspeed10M: List<double>.from(json["windspeed_10m"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "relativehumidity_2m": List<dynamic>.from(relativehumidity2M.map((x) => x)),
        "windspeed_10m": List<dynamic>.from(windspeed10M.map((x) => x)),
    };
}

class HourlyUnits {
    String time;
    String temperature2M;
    String relativehumidity2M;
    String windspeed10M;

    HourlyUnits({
        required this.time,
        required this.temperature2M,
        required this.relativehumidity2M,
        required this.windspeed10M,
    });

    factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        relativehumidity2M: json["relativehumidity_2m"],
        windspeed10M: json["windspeed_10m"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "relativehumidity_2m": relativehumidity2M,
        "windspeed_10m": windspeed10M,
    };
}
