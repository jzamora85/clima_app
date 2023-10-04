import 'package:clima_app/models/location_data.dart';
import 'package:clima_app/models/weather_data.dart';
import 'package:clima_app/services/http_handler.dart';
import 'package:geolocator/geolocator.dart';

Future<WeatherData> getWeatherByPosition(double latitude, double longitude) async {
  final response = await handleHTTP(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m&forecast_days=1');
  final weatherData = WeatherData.fromJson(response.data);
  return weatherData;
}

Future<List<LocationData>> getLocationsByName(String query) async {
  final response = await handleHTTP(
      'https://geocoding-api.open-meteo.com/v1/search?name=$query');
  if (response.data["results"] != null) {
    return List<LocationData>.from(
        response.data["results"].map((x) => LocationData.fromJson(x)))
        .where((item) => item.country != null).toList();
  } else {
    return [];
  }
}

Future<LocationData> getCurrentLocation() async {
  LocationData locationData =
      LocationData(id: 0, name: "", latitude: 0, longitude: 0, country: "");
  try {
    // Get the current position (geolocation)
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    locationData.latitude = position.latitude;
    locationData.longitude = position.longitude;
  } catch (e) {
    print("Error getting location or address: $e");
  }
  return locationData;
}
