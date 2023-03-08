import 'package:flutter/material.dart';
import 'package:weatherapp/controllers/get%20controller.dart';
import 'package:get/get.dart';

import 'package:weatherapp/pages/home%20page.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<DataController>(
      init: DataController(),
      builder: (controller) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: TextField(
            onSubmitted: (text) async {
              cityName = text;
              controller.weatherModel = await controller.getWeather(cityName!);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              hintText: 'Enter City Name',
              labelText: 'Search',
              suffixIcon: IconButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage())),
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
