import 'package:clima_app/models/location_data.dart';
import 'package:clima_app/providers/location_data_provider.dart';
import 'package:clima_app/providers/weather_data_provider.dart';
import 'package:clima_app/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCity extends ConsumerStatefulWidget {
  const SearchCity({
    super.key,
  });

  @override
  ConsumerState<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends ConsumerState<SearchCity> {
  final _controller = TextEditingController();

  List<LocationData> locations = List.empty();

  @override
  void initState() {
    getCurrentLocation().then((location) => {
          getWeatherByPosition(location.latitude, location.longitude)
              .then((weather) => setState(() {
                    ref.read(weatherDataNotifier).setWeatherData(weather);
                  }))
        });
    super.initState();
  }

  void searchLocations(String query) {
    getLocationsByName(query).then(
      (value) => setState(() {
        if (value.isNotEmpty) {
          locations = value;
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              onChanged: searchLocations,
              decoration: const InputDecoration(
                hintText: 'Buscar ciudad...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "${locations[index].name} ${locations[index].country}"),
                  onTap: () {
                    _controller.text = "";
                    setState(() {
                      ref
                          .read(locationDataNotifier)
                          .setLocationData(locations[index]);
                      getWeatherByPosition(locations[index].latitude,
                              locations[index].longitude)
                          .then((weather) => ref
                              .read(weatherDataNotifier)
                              .setWeatherData(weather));
                      locations = List<LocationData>.empty();
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
