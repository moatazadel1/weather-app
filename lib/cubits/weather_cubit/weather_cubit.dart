import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  void getCurrentWeather({required String cityName}) async {
    emit(LoadingState());
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(FailureState(errorMessage: e.toString()));
    }
  }
}
