import 'package:flutter/material.dart';
import 'package:next_trip_decider/Prefecture.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  List<Prefecture> prefectures = [];

  @override
  void initState() {
    super.initState();

    for (var prefecture in Prefecture.values) {
      prefectures.add(prefecture);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressCircle(),
        Expanded(
            child: ListView(
              children: [
                for (var prefecture in prefectures)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        _checkButton(),
                        Text(prefecture.displayName, style: TextStyle(fontSize: 25),)
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

// TODO: プログレスバーの見た目を整える
class ProgressCircle extends StatelessWidget {
  const ProgressCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        CircularProgressIndicator(
          value: 0.8,
        ),
        Text("テスト"),
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

