import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/get%20controller.dart';

DataController controller = Get.put(DataController());

bool isDay(String text) {
  String newText = text.split(':')[0].substring(10);
  int d = int.parse(newText);
  if (d <= 18 && d >= 6)
    return true;
  else
    return false;
}

Widget foreCastBuilder(
    {required String avgTe,
    required String icon,
    required String dayDate,
    required String cond}) {
  DateTime date = DateTime.parse(dayDate);
  String dayName = DateFormat('EEEE').format(date);

  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.2,
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                dayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                avgTe,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Image.network('https:$icon'),
              ),
              Text(
                cond,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  overflow: TextOverflow.fade,
                ),
                maxLines: 1,
              ),
            ],
          )
        ],
      ),
    ),
  );
}

void search(String cityName, BuildContext context) async {
  if (cityName.isEmpty) {
    Get.snackbar(
      'Warning',
      "the seach input field must't be null ",
      icon: Icon(
        Icons.warning,
        color: Colors.red,
      ),
      colorText: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  } else {
    controller.weatherModel = await controller.getWeather(cityName!);
    Navigator.of(context).pop();
  }
}
