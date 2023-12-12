import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherData extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherData({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorFromCondition(weatherModel.weatherCondition),
              colorFromCondition(weatherModel.weatherCondition)[200]!,
              colorFromCondition(weatherModel.weatherCondition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "https:${weatherModel.image}",
                ),
                Text(
                  "${weatherModel.avgTemp}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Maxtemp: ${weatherModel.maxTemp.round()}",
                    ),
                    Text(
                      "Mintemp: ${weatherModel.minTemp.round()}",
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
