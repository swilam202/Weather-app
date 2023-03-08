import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather%20model.dart';

class Weather {



   getWeather(String cityName)async{

    Uri url = Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=14cec32e400a4edbad4105818230203&q=London&days=7&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String,dynamic> data = jsonDecode(response.body);
    WeatherModel weatherModel =  WeatherModel.fromJson(data);
    print(data);
    return weatherModel;
  }

}