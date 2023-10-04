import 'package:clima_app/models/location_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationDataNotifier =
    ChangeNotifierProvider((ref) => LocationDataProvider());

class LocationDataProvider extends ChangeNotifier {
  LocationData locationData =
      LocationData(id: 0, name: "", latitude: 0, longitude: 0, country: "");

  setLocationData(LocationData data) {
    locationData = data;
    notifyListeners();
  }
}
