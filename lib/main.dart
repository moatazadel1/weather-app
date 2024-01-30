import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_screen.dart';

import 'cubits/weather_cubit/weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: colorFromCondition(
                      BlocProvider.of<WeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition)),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
              routes: {
                "home": (context) => const HomePage(),
                "search": (context) => const SearchScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}

MaterialColor colorFromCondition(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
    case 'mist':
      return Colors.blueGrey;

    case 'patchy rain possible':
    case 'light drizzle':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.blue;

    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'patchy light drizzle':
    case 'moderate rain at times':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;

    case 'patchy freezing fog':
    case 'blowing snow':
    case 'blizzard':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    case 'patchy light sleet':
    case 'moderate or heavy sleet':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.indigo;

    case 'thundery outbreaks possible':
      return Colors.deepOrange;

    case 'light freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.teal;

    case 'ice pellets':
      return Colors.green;

    default:
      return Colors.blue; // Default color if condition not found
  }
}
