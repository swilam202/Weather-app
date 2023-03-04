import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather%20model.dart';

class Weather {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String key = '14cec32e400a4edbad4105818230203';


  getWeather(String cityName)async{
   // http://api.weatherapi.com/v1/current.json?key=14cec32e400a4edbad4105818230203&q=London&aqi=no
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$key&q=$cityName&aqi=no');
    http.Response response = await http.get(url);
    Map<String,dynamic> data = jsonDecode(response.body);
    ///WeatherModel weatherModel = WeatherModel.fromJson(data);
    print(data);
   ///  return weatherModel;
  }

}