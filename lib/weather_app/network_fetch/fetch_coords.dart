import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationData {
  final double latitude;
  final double longitude;

  LocationData({required this.latitude, required this.longitude});

  factory LocationData.fromJson(Map<String, dynamic> json) {
    final lat = json['lat'] as double?;
    final lon = json['lon'] as double?;
    if (lat != null && lon != null) {
      return LocationData(latitude: lat, longitude: lon);
    } else {
      throw Exception('Failed to parse location data');
    }
  }
}

Future<LocationData> getLocationData(String query) async {
  final apiKey = 'b919d40ede2a4ef309dc3fd74d6fef94';
  final url =
      'https://api.openweathermap.org/geo/1.0/direct?q=$query&limit=5&appid=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body) as List<dynamic>;
    if (data.isNotEmpty) {
      final locationData = LocationData.fromJson(data[0] as Map<String, dynamic>);
      return locationData;
    } else {
      throw Exception('No data found');
    }
  } else {
    throw Exception('Failed to load data');
  }
}
