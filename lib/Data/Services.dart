import 'dart:convert';

import 'package:http/http.dart' as http;

Future<WeatherData> fetchData(String input) async {
  final response = await http.get(
      'http://api.openweathermap.org/data/2.5/weather?q={input}&appid=26ed371daca03575e4668be4d33c46e2');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var myData = json.decode(response.body);
    // print(myData);
    var rest = myData["data"];
    // print(rest);
    return WeatherData.fromJson(rest['main']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class WeatherData {
  final String temp;
  final String description;
  final String currently;
  final String humidity;
  final String windSpeed;

  WeatherData(
      {this.temp,
      this.description,
      this.currently,
      this.humidity,
      this.windSpeed});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temp: json['main']['temp'],
      description: json['weather'][0]['description'],
      currently: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
    );
  }
}
