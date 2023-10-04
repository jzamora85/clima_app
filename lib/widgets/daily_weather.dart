import 'package:clima_app/models/location_data.dart';
import 'package:clima_app/models/weather_data.dart';
import 'package:clima_app/providers/location_data_provider.dart';
import 'package:clima_app/providers/weather_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyWeather extends ConsumerStatefulWidget {
  const DailyWeather({
    super.key,
  });

  @override
  ConsumerState<DailyWeather> createState() => _DailyWeatherState();
}

class _DailyWeatherState extends ConsumerState<DailyWeather> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WeatherData weatherData = ref.watch(weatherDataNotifier).weatherData;
    LocationData locationData = ref.watch(locationDataNotifier).locationData;

    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Column(children: [
            Text(
              locationData.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Temperatura ${weatherData.currentWeather.temperature} °c',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Viento ${weatherData.currentWeather.windspeed} km/h',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Clima ${getWeatherDescription(weatherData.currentWeather.weathercode)}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ]),
        )
      ],
    );
  }

  getWeatherDescription(int code) {
    if (code == 0) {
      return 'Despejado';
    } else if (code == 1 || code == 2 || code == 3) {
      return 'Parcialmente nublado';
    } else if (code == 45 || code == 48) {
      return 'Niebla';
    } else if (code >= 50 && code <= 59) {
      return 'Llovizna';
    } else if (code >= 60 && code <= 69) {
      return 'Tormenta';
    } else if (code >= 70 && code <= 79) {
      return 'Nieve';
    } else {
      return 'Piedra';
    }
  }
}
