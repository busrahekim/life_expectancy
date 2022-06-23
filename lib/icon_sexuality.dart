import 'package:flutter/material.dart';
import 'package:life_expectancy/constants.dart';

class IconSexuality extends StatelessWidget {
  final IconData icon;
  final String sexuality;
  IconSexuality({this.icon, this.sexuality});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 50, color: Colors.black54),
        SizedBox(height: 10),
        Text(sexuality, style: ts),
      ],
    );
  }
}
