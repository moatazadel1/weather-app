import 'package:intl/intl.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      // date: DateTime.parse(json['location']['localtime']),
      date: DateFormat('yyyy-MM-dd H:mm').parse(json['location']['localtime']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
