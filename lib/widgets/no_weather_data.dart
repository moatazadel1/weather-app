import 'package:flutter/material.dart';

class NoWeatherData extends StatelessWidget {
  const NoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Weather Information Available 😔",
            style: TextStyle(fontSize: 23),
          ),
          Text(
            "Start Your Search! 🔍",
            style: TextStyle(fontSize: 23),
          ),
        ],
      ),
    );
  }
}
