import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';
import 'icon_sexuality.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedSexuality;
  double smoke = 0.0;
  double sport = 0.0;
  int height = 170;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIFE EXPECTANCY',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('HEIGHT'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('WEIGHT'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'How many times do you sport in a week ?',
                    style: ts,
                  ),
                  Text(
                    sport.round().toString(),
                    style: ns,
                  ),
                  Slider(
                    value: sport,
                    onChanged: (double value) {
                      setState(() {
                        sport = value;
                      });
                    },
                    min: 0,
                    max: 7,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'How many times do you smoke in a day ?',
                    style: ts,
                  ),
                  Text(
                    smoke.round().toString(),
                    style: ns,
                  ),
                  Slider(
                    value: smoke,
                    onChanged: (double value) {
                      setState(() {
                        smoke = value;
                      });
                    },
                    min: 0,
                    max: 30,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    buttonActioned: () {
                      setState(() {
                        selectedSexuality = 'WOMAN';
                      });
                    },
                    mycolor: selectedSexuality == 'WOMAN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: IconSexuality(
                        icon: FontAwesomeIcons.venus, sexuality: 'WOMAN'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    buttonActioned: () {
                      setState(() {
                        selectedSexuality = 'MAN';
                      });
                    },
                    mycolor: selectedSexuality == 'MAN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: IconSexuality(
                      icon: FontAwesomeIcons.mars,
                      sexuality: 'MAN',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                          selectedSexuality: selectedSexuality,
                          height: height,
                          weight: weight,
                          smoke: smoke,
                          sport: sport),
                    ),
                  ),
                );
              },
              child: Text('CALCULATE', style: ts),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            s,
            style: ts,
          ),
        ),
        SizedBox(width: 10),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            s == 'HEIGHT' ? height.toString() : weight.toString(),
            style: ns,
          ),
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                  child: Icon(FontAwesomeIcons.plus, size: 10),
                  onPressed: () {
                    setState(() {
                      s == 'HEIGHT' ? height++ : weight++;
                    });
                  }),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                  child: Icon(FontAwesomeIcons.minus, size: 10),
                  onPressed: () {
                    setState(() {
                      s == 'HEIGHT' ? height-- : weight--;
                    });
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
