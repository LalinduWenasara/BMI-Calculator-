import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard2 extends StatelessWidget {
  ReusableCard2({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(15),
    );
  }
}
