import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search a city",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: TextFormField(
              onFieldSubmitted: (cityName) async {
                BlocProvider.of<WeatherCubit>(context)
                    .getCurrentWeather(cityName: cityName);
                Navigator.pop(context);
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
      ),
    );
  }
}
