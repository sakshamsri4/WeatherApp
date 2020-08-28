import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Weather_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //padding: EdgeInsets.all(10.0),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                "Search Weather",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey),
              ),
            ),
            Text(
              "Instanly",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: Colors.blueGrey),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherScreen(
                              input: input,
                            )),
                  );
                },
                style: TextStyle(color: Colors.blueGrey, fontSize: 25),
                decoration: InputDecoration(
                  hintText: 'Search another location...',
                  hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                  prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
