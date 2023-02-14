import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherApiClient{
  Future<Weather>? GetCurrentWeather(String? location) async{
    var endPoint=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8e52efa19a1aadde37180cdd30f60f85&units=metric");
  var response= await http.get(endPoint);
  var body = jsonDecode(response.body);
  print(Weather.fromJson(body).cityName);
  return Weather.fromJson(body);
  }
}