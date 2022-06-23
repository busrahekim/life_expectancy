import 'package:flutter/material.dart';
import 'package:life_expectancy/calculation.dart';
import 'package:life_expectancy/user_data.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                Calculation(_userData).calculate().toString(),
                style: ts,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'RETURN',
                style: ts,
              ),
            ),
          )
        ],
      ),
    );
  }
}
