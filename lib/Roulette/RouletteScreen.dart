import 'package:flutter/material.dart';

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

class _StartRouletteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          print("押された！");
        },
        child: Text("旅をする", style: TextStyle(fontSize: 30)),
        padding: EdgeInsets.all(80),
        color: Colors.orange,
        textColor: Colors.white,
        shape: CircleBorder()
    );
  }
}