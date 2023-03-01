import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../Prefecture.dart';

class RouletteScreen extends StatefulWidget {
  const RouletteScreen({Key? key}) : super(key: key);

  @override
  State<RouletteScreen> createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  Prefecture? selectedPrefecture;

  void _setPrefecture(Prefecture prefecture) {
    setState(() {
      selectedPrefecture = prefecture;
    });
  }

  @override
  Widget build(BuildContext context) {
    String displayText() {
      if (selectedPrefecture != null) {
        return selectedPrefecture!.displayName;
      }
      return "ボタンを押してね👇";
    };

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(displayText(), style: TextStyle(fontSize: 25)),
        SizedBox(height: 30),
        _StartRouletteButton(
          buttonHandler: _setPrefecture,
        )
      ]
    );
  }
}

class _StartRouletteButton extends StatelessWidget {
  final Function buttonHandler;
  const _StartRouletteButton({Key? key, required this.buttonHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          print("押された！");
          startRoulette();
        },
        child: Text("旅をする", style: TextStyle(fontSize: 30)),
        padding: EdgeInsets.all(80),
        color: Colors.orange,
        textColor: Colors.white,
        shape: CircleBorder()
    );
  }

  void startRoulette() {
    final randomNumber = math.Random().nextInt(47);
    print(randomNumber);
    buttonHandler(Prefecture.values[randomNumber]);
  }
}