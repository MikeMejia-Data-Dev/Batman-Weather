import 'package:dio/dio.dart';

import '../../../../core/config/env_config.dart';
import '../../../../core/network/dio_client.dart';

class WeatherApiService {
  final Dio dio = DioClient.instance;

  Future<Map<String, dynamic>> fetchWeather(
    String city,
  ) async {
    try {
      final response = await dio.get(
        '/weather',

        queryParameters: {
          'q': city,
          'appid': EnvConfig.weatherApiKey,
          'units': 'metric',
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';

      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return 'Request cancelled';

      case DioExceptionType.connectionError:
        return 'No internet connection';

      default:
        return 'Unexpected error occurred';
    }
  }

  String _handleBadResponse(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return 'Bad request';

      case 401:
        return 'Unauthorized';

      case 404:
        return 'City not found';

      case 500:
        return 'Server error';

      default:
        return 'Something went wrong';
    }
  }
}