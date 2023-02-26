import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
              children: [
                for (var prefecture in ["北海道", "青森県", "北海道", "青森県", "北海道", "青森県", "北海道", "青森県"])
                  Row(
                    children: [
                      _checkButton(),
                      Text(prefecture)
                    ],
                  )
              ],
            )
        )
      ],
    );
  }
}

class _checkButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.check_circle_outline),
        onPressed: () {
          // ボタンが押された際の動作を記述する
        },
    );
  }
}