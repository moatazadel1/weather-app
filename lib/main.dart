import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/helper/color_from_condition.dart';
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
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          MaterialColor color = colorFromCondition(
              BlocProvider.of<WeatherCubit>(context)
                  .weatherModel
                  ?.weatherCondition);
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: color,
              ),
              primarySwatch: color,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            routes: {
              "home": (context) => const HomePage(),
              "search": (context) => const SearchScreen(),
            },
          );
        },
      ),
    );
  }
}
