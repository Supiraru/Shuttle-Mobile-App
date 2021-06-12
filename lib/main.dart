import 'package:flutter/material.dart';
import 'package:shuttle/auth.dart';
import 'package:shuttle/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shuttle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (context) => new LandingScreen(),
        '/home': (context) => new Home(),
      },
    );
  }
}
