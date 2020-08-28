import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Data/Services.dart';
import 'package:weather_app/Data/city.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<WeatherData> futureAlbum;
  String input = City.getInstance().getIData();
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchData(input);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherData>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return test(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget test(WeatherData weatherData) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Weather App'),
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Currently in {input}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          weatherData.temp.toString() + "\u00B0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            weatherData.currently.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: Text('Temperature'),
                                  trailing: Text(weatherData.description),
                                ),
                                ListTile(
                                  title: Text('Weather'),
                                  trailing: Text(weatherData.description),
                                ),
                                ListTile(
                                  title: Text('Humidity'),
                                  trailing: Text(weatherData.humidity),
                                ),
                                ListTile(
                                  title: Text('Wind Speed'),
                                  trailing: Text(weatherData.windSpeed),
                                )
                              ],
                            ),
                          ),
                        )
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
