import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Flutter Weather App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Enter the City'),
            Text('Enter the City'),
          ],
        ),
      ),
    );
  }
}
