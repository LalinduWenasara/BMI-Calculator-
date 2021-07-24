import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
class insidecont extends StatelessWidget {
  insidecont({required this.icon, required this.textt});
  final IconData icon;
  final String textt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(icon, size: 100.0),
          SizedBox(
            height: 20,
          ),
          Text(
            textt,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
