import 'dart:convert';

import 'package:http/http.dart' as http;

Future<WeatherData> fetchData(String input) async {
  print(input);
  var str = 'http://api.openweathermap.org/data/2.5/weather?q=' +
      input +
      '&appid=26ed371daca03575e4668be4d33c46e2';
  final response = await http.get(str);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var myData = json.decode(response.body);
    // print(myData);
    // print(rest);
    return WeatherData.fromJson(myData);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
  }
}

class WeatherData {
  final double temp;
  final String description;
  final String currently;
  final int humidity;
  final double windSpeed;

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
