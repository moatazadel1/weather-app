import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_data.dart';
import 'package:weather_app/widgets/weather_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("search");
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherData();
          } else if (state is CurrentWeatherState) {
            return WeatherData(weatherModel: state.weatherModel);
          } else {
            return const Text('opps there is an error, try later');
          }
        },
      ),
    );
  }
}
