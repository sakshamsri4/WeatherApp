import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Data/Services.dart';

class WeatherScreen extends StatefulWidget {
  final String input;
  WeatherScreen({Key key, @required this.input}) : super(key: key);
  @override
  _WeatherScreenState createState() => _WeatherScreenState(input);
}

class _WeatherScreenState extends State<WeatherScreen> {
  String input;
  _WeatherScreenState(this.input);
  Future<WeatherData> futureAlbum;
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
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Weather App'),
            ),
            body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget test(WeatherData weatherData) {
    if (weatherData.humidity == 100)
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Weather App'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Some Error Occurred, Invalid City Name!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.mood_bad,
                    color: Colors.blue,
                    size: 50.0,
                  ),
                ],
              ),
            ),
          ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                child: Text(
                  "${input} ",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                weatherData.temp.toString() + "\u00B0" + "F",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Temperature',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          weatherData.temp.toString() + "\u00B0" + "F",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Icon(
                          Icons.wb_sunny,
                          color: Colors.amber,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Weather',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          weatherData.currently,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Icon(
                          Icons.wb_cloudy,
                          color: Colors.black12,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Humidity',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          weatherData.humidity.toString() + "%",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Icon(
                          Icons.grain,
                          color: Colors.blue,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Wind Speed',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          weatherData.windSpeed.toString() + "m/s",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Icon(Icons.flag, color: Colors.blueAccent),
                      ),
                      ListTile(
                        title: Text(
                          'Temp Max',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          weatherData.max.toString() + "\u00B0" + "F",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Icon(
                          Icons.brightness_high,
                          color: Colors.amber,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Temp Min',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          weatherData.min.toString() + "\u00B0" + "F",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Icon(
                          Icons.brightness_low,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
