import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
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
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherData();
          } else if (state is WeatherSuccessState) {
            return const WeatherData();
          } else if (state is FailureState) {
            return Center(
                child: Text('opps there is an error,${state.errorMessage}'));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
