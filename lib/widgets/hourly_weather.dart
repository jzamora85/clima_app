import 'package:clima_app/models/weather_data.dart';
import 'package:clima_app/providers/weather_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HourlyWeather extends ConsumerStatefulWidget {
  const HourlyWeather({
    super.key,
  });

  @override
  ConsumerState<HourlyWeather> createState() => _HourlyWeatherState();
}

class _HourlyWeatherState extends ConsumerState<HourlyWeather> {
  @override
  Widget build(BuildContext context) {
    WeatherData weatherData = ref.watch(weatherDataNotifier).weatherData;
    return Column(
      children: [
        Text(
          'Proximas horas:',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: getWeekWeather(weatherData),
          ),
        ),
      ],
    );
  }
}

getWeekWeather(WeatherData weatherData) {
  List<Widget> weekWeather = [];
  for (var i = 0; i < weatherData.hourly.time.length; i++) {
    weekWeather.add(SizedBox(
      width: 160,
      child: Column(
        children: [
          Text(
            weatherData.hourly.time[i].substring(11),
          ),
          Text('${weatherData.hourly.temperature2M[i]} °c')
        ],
      ),
    ));
  }
  return weekWeather;
}
