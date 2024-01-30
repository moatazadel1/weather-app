// // polymorphism

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class LoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {}

class FailureState extends WeatherState {
  final String errorMessage;

  FailureState({required this.errorMessage});
}
