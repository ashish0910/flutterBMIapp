import 'package:bmiapp/ui/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "BMI app",
      theme: new ThemeData(
        primarySwatch: Colors.pink
      ),
      home: new Home(),
    ) ;
  }
}