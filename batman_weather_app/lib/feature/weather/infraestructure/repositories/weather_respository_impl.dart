import '../../domain/models/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../services/weather_api_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepositoryImpl(this.apiService);

  @override
  Future<Weather> getWeather(String city) async {
    final data = await apiService.fetchWeather(city);

    return Weather(
      cityName: data['name'],
      temperature: data['main']['temp'].toDouble(),
      description: data['weather'][0]['description'],
      icon: data['weather'][0]['icon'],
    );
  }
}