import 'package:get/get.dart';
import 'package:weatherapp/DataBase/DBHelper.dart';
import 'package:weatherapp/models/weather%20model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  WeatherModel? weatherModel;
  String baseUrl = 'http://api.weatherapi.com/v1';
  String key = '14cec32e400a4edbad4105818230203';
  List cities = [];
  DBHelper dbHelper = DBHelper();

  getWeather(String cityName) async {
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$key&q=$cityName&days=7&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromJson(data);

    update();
    return weatherModel;
  }

  buildList() async {
    cities = await dbHelper.queryData('cities');
    update();
  }
}
