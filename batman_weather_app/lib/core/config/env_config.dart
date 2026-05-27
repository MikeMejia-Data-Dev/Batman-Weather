import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get weatherApiKey {
    final key = dotenv.env['OPEN_WEATHER_API_KEY'];

    print('API KEY: $key');

    return key ?? '';
  }
}