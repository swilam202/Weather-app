class WeatherModel {
  String cityName;
  String dayDate;
  double dayMaxTemp;
  double dayAvgTemp;
  double dayMinTemp;
  double dayWindSpeed;
  String dayConditionName;
  String dayConditionIcon;
  List hourData;
  List forecast;

  WeatherModel({
    required this.cityName,
    required this.dayDate,
    required this.dayMaxTemp,
    required this.dayAvgTemp,
    required this.dayMinTemp,
    required this.dayWindSpeed,
    required this.dayConditionName,
    required this.dayConditionIcon,
    required this.hourData,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var baseDay = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      cityName: data['location']['name'],
      dayDate: data['location']['localtime'],
      dayMaxTemp: baseDay['maxtemp_c'],
      dayAvgTemp: baseDay['avgtemp_c'],
      dayMinTemp: baseDay['mintemp_c'],
      dayWindSpeed: baseDay['maxwind_mph'],
      dayConditionName: baseDay['condition']['text'],
      dayConditionIcon: baseDay['condition']['icon'],
      hourData: data['forecast']['forecastday'][0]['hour'],
      forecast: data['forecast']['forecastday'],
    );
  }
}
