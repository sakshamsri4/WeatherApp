import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Flutter Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text('New York',
                            style: new TextStyle(color: Colors.white)),
                        Text('Rain',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 32.0)),
                        Text('72°F', style: new TextStyle(color: Colors.white)),
                        Image.network(
                            'https://openweathermap.org/img/w/01d.png'),
                        Text('Jun 28, 2018',
                            style: new TextStyle(color: Colors.white)),
                        Text('18:30',
                            style: new TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
