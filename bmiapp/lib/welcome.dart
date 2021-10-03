import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF4d5361),

    body:Center(
    child: ElevatedButton(
    child: Text('Welcome'),
    onPressed: () {
    // Navigate to second route when tapped.
    },
    ),











    ));
  }
}
