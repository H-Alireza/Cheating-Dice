import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.black54,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int lDiceNumber = 1;
  int rDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void cheatDiceFace() {
    lDiceNumber = Random().nextInt(6) + 1;
    rDiceNumber = Random().nextInt(6) + 1;
    if (lDiceNumber + rDiceNumber >= rightDiceNumber + leftDiceNumber) {
      setState(() {
        rightDiceNumber = rDiceNumber;
        leftDiceNumber = lDiceNumber;
      });
    } else {
      cheatDiceFace();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: () {
              changeDiceFace();
            },
            child: Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/dice$leftDiceNumber.png',
                      ),
                    ),
                  ),
                  //Get students to create the second die as a challenge
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/dice$rightDiceNumber.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 200.0, bottom: 70.0),
          child: SizedBox(
            width: 80.0,
            height: 80.0,
            child: TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {
                cheatDiceFace();
              },
              child: SizedBox(
                width: 80.0,
                height: 80.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
