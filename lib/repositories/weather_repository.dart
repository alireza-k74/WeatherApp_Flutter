import '../models/weather_model.dart';
import '../services/weather_api_service.dart';

class WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepository({required this.apiService});

  Future<Weather> getWeather(String city) async {
    return await apiService.fetchWeather(city);
  }
}
