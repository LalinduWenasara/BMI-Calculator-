import 'package:bmiapp/welcome.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF4d5361),
        scaffoldBackgroundColor: Color(0xFF4d5361),
        accentColor: Colors.cyan[600],
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.blue),
        ),
      ),
      home: InputPage(),
    );
  }
}
