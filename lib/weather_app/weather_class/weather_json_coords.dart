class MyWeathercoords {
  MyWeathercoords({
    required this.name,
    required this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  String name;
  Map<String, String> localNames;
  double lat;
  double lon;
  String country;
  String state;

  factory MyWeathercoords.fromJson(Map<String, dynamic> json) =>
      MyWeathercoords(
        name: json["name"],
        localNames: Map.from(json["local_names"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        country: json["country"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "local_names":
            Map.from(localNames).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "lat": lat,
        "lon": lon,
        "country": country,
        "state": state,
      };
}
