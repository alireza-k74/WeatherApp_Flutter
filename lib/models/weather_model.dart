class Weather {
  final String cityName;
  final double temperature;
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature:
          (json['main']['temp'] - 273.15), // Convert from Kelvin to Celsius
      description: json['weather'][0]['description'],
    );
  }
}
