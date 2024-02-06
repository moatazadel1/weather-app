// // polymorphism

import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class LoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherModel weatherModel;

  WeatherSuccessState({required this.weatherModel});
}

class FailureState extends WeatherState {
  final String errorMessage;

  FailureState({required this.errorMessage});
}
