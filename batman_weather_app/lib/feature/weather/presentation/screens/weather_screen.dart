import 'package:flutter/material.dart';

import '../../domain/models/weather.dart';
import '../../domain/usecases/get_weather_usecase.dart';

import '../../infraestructure/repositories/weather_respository_impl.dart';
import '../../infraestructure/services/weather_api_service.dart';

import '../widgets/weather_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() =>
      _WeatherScreenState();
}

class _WeatherScreenState
    extends State<WeatherScreen> {

  final TextEditingController controller =
      TextEditingController();

  Weather? weather;

  bool isLoading = false;

  late final GetWeatherUseCase useCase;

  @override
  void initState() {
    super.initState();

    final apiService =
        WeatherApiService();

    final repository =
        WeatherRepositoryImpl(apiService);

    useCase =
        GetWeatherUseCase(repository);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// DYNAMIC BATMAN BACKGROUND
  String getBackgroundGif() {

    if (weather == null) {
      return 'assets/gifs/batman_belly.gif';
    }

    final temp = weather!.temperature;

    /// COLD WEATHER
    if (temp <= 10) {
      return 'assets/gifs/gif.gif';
    }

    /// NORMAL WEATHER
    if (temp <= 25) {
      return 'assets/gifs/batman_belly.gif';
    }

    /// HOT WEATHER
    return 'assets/gifs/dc_comics.gif';
  }

  Future<void> fetchWeather() async {

    final city =
        controller.text.trim();

    if (city.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a city',
          ),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {

      final result =
          await useCase.execute(city);

      setState(() {
        weather = result;
      });

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );

    } finally {

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          /// BACKGROUND GIF
          SizedBox.expand(
            child: Image.asset(
              getBackgroundGif(),

              fit: BoxFit.cover,
            ),
          ),

          /// DARK OVERLAY
          Container(
            color:
                Colors.black.withOpacity(
              0.55,
            ),
          ),

          /// CONTENT
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,

                children: [

                  const SizedBox(height: 40),

                  /// TITLE
                  const Text(
                    'Batman Weather',
                    textAlign:
                        TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// CITY INPUT
                  TextField(
                    controller:
                        controller,

                    style:
                        const TextStyle(
                      color: Colors.white,
                    ),

                    textInputAction:
                        TextInputAction
                            .search,

                    onSubmitted: (_) =>
                        fetchWeather(),

                    decoration:
                        InputDecoration(

                      hintText:
                          'Enter city',

                      hintStyle:
                          const TextStyle(
                        color:
                            Colors.white70,
                      ),

                      filled: true,

                      fillColor:
                          Colors.black54,

                      prefixIcon:
                          const Icon(
                        Icons.location_city,
                        color:
                            Colors.white,
                      ),

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                          14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// BUTTON
                  ElevatedButton(
                    onPressed:
                        isLoading
                            ? null
                            : fetchWeather,

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.yellow,

                      foregroundColor:
                          Colors.black,

                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                    ),

                    child: const Text(
                      'Get Weather',
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// LOADING
                  if (isLoading)
                    const Center(
                      child:
                          CircularProgressIndicator(
                        color:
                            Colors.yellow,
                      ),
                    ),

                  /// WEATHER CARD
                  if (weather != null &&
                      !isLoading)
                    WeatherCard(
                      weather: weather!,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}