import 'package:flutter/material.dart';

class WeatherModel {
   String cityName;
   String dayDate;
   double dayMaxTemp;
   double dayAvgTemp;
   double dayMinTemp;
   double dayWindSpeed;
   String dayConditionName;
   Icon dayConditionIcon;

   String hourDate;
   double hourTemp;
   String hourConditionName;
   Icon hourConditionIcon;



  WeatherModel({
    required this.cityName,
    required this.dayDate,
    required this.dayMaxTemp,
    required this.dayAvgTemp,
    required this.dayMinTemp,
    required this.dayWindSpeed,
    required this.dayConditionName,
    required this.dayConditionIcon,
    required this.hourDate,
    required this.hourTemp,
    required this.hourConditionName,
    required this.hourConditionIcon,
  });



  factory WeatherModel.fromJson(dynamic data) {
    var baseDay = data['forecast']['forecastday']['day'];
    var baseHour = data['forecast']['forecastday']['hour'][0];

    return WeatherModel(
        cityName: data['location']['name'],
        dayDate: data['location']['localtime'],
        dayMaxTemp: baseDay['maxtemp_c'],
        dayAvgTemp: baseDay['avgtemp_c'],
        dayMinTemp: baseDay['mintemp_c'],
        dayWindSpeed: baseDay['maxwind_mph'],
        dayConditionName: baseDay['condition']['text'],
        dayConditionIcon: baseDay['condition']['icon'],
        hourDate: baseHour['time'],
        hourTemp: baseHour['temp_c'],
        hourConditionName: baseHour['condition']['text'],
        hourConditionIcon: baseHour['condition']['icon'],

    );

  }



}
