import 'package:flutter/material.dart';
import 'package:weatherapp/get%20controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp/get controller.dart';
import 'package:weatherapp/models/weather%20model.dart';
import 'package:weatherapp/pages/home%20page.dart';
import '../services/weather services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  Function() fn;
  TextEditingController controller = TextEditingController();
  SearchPage(this.fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          centerTitle: true,
        ),
        body: GetBuilder<DataController>(
          init: DataController(),
          builder: (controller)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: TextField(
              onSubmitted: (text) async {
                cityName = text;
              ///  Weather weather = Weather();
                controller.weatherModel = await controller.getWeather(cityName!);
                ()=>fn;
                print("***********************${controller.weatherModel!.cityName}**********************");

                Get.back();
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
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())),
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        )
    );
  }
}
