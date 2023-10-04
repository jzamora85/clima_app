// To parse this JSON data, do
//
//     final locationData = locationDataFromJson(jsonString);

import 'dart:convert';

LocationData locationDataFromJson(String str) => LocationData.fromJson(json.decode(str));

String locationDataToJson(LocationData data) => json.encode(data.toJson());

class LocationData {
    int id;
    String name;
    double latitude;
    double longitude;
    String? country;

    LocationData({
        required this.id,
        required this.name,
        required this.latitude,
        required this.longitude,
        this.country,
    });

    factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "country": country,
    };
}
