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
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        _checkButton(),
                        Text(prefecture, style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  )
              ],
            )
        )
      ],
    );
  }
}

class _checkButton extends StatefulWidget {
  @override
  State<_checkButton> createState() => _checkButtonState();
}

class _checkButtonState extends State<_checkButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: isTapped ? const Icon(Icons.check_circle) : const Icon(Icons.check_circle_outline),
        color: isTapped ? Colors.orange : Colors.grey,
        onPressed: () {
          setState(() {
            isTapped = !isTapped;
            if (isTapped) {
              // TODO: DBに保存する
            } else {
              // TODO: DBから削除する
            }
          });
          print("押された！");
        },
        iconSize: 40,
    );
  }
}

