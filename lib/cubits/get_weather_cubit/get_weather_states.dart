import '../../models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class CurrentWeatherState extends WeatherState {
  final WeatherModel weatherModel;

  CurrentWeatherState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {}

// polymorphism
