import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Data/city.dart';
import 'package:weather_app/Screens/Weather_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onTextSubmit(String input) {
    City.getInstance().setIData(input);
    print(input);
    WeatherScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Search Weather",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70),
            ),
            Text(
              "Instanly",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                  color: Colors.white70),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: TextField(
                onSubmitted: (String input) {
                  onTextSubmit(input);
                },
                style: TextStyle(color: Colors.white, fontSize: 25),
                decoration: InputDecoration(
                  hintText: 'Search another location...',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
