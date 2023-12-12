import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a city",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
            onFieldSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getCurrentWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              labelText: "Search",
              suffixIcon: Icon(Icons.search),
              hintText: "Enter city name",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
