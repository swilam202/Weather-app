import 'package:flutter/material.dart';

import '../services/weather services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: TextField(
          onSubmitted: (text) {
            cityName = text;
            Weather weather = Weather();
            weather.getWeather(cityName!);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            hintText: 'Enter City Name',
            labelText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
