import 'package:flutter/material.dart';

import '../Prefecture.dart';

class RouletteScreen extends StatelessWidget {
  const RouletteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("ボタンを押してね👇", style: TextStyle(fontSize: 25)),
        SizedBox(height: 30),
        _StartRouletteButton()
      ]
    );
  }
}

class _StartRouletteButton extends StatefulWidget {
  @override
  State<_StartRouletteButton> createState() => _StartRouletteButtonState();
}

class _StartRouletteButtonState extends State<_StartRouletteButton> {
  get math => null;
  Prefecture? selectedPrefecture;

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
    final randomNumber = math.Random(47);
    selectedPrefecture = Prefecture.values[randomNumber];
  }
}