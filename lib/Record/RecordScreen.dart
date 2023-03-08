import 'package:flutter/material.dart';
import 'package:next_trip_decider/Prefecture.dart';
import '../PrefectureModel.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  List<Prefecture> prefectures = [];
  List<PrefectureModel> selectedPrefectures = [];

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
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: ProgressCircle(),
        ),
        Expanded(
            child: ListView(
              children: [
                for (var prefecture in prefectures)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        const CheckButton(),
                        Text(prefecture.displayName, style: const TextStyle(fontSize: 25),)
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

class ProgressCircle extends StatefulWidget {
  const ProgressCircle({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressCircle> createState() => _ProgressCircleState();
}

class _ProgressCircleState extends State<ProgressCircle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const SizedBox(
          height: 130,
          width: 130,
          child: CircularProgressIndicator(
            value: 0.8,
            strokeWidth: 10.0,
            backgroundColor: Colors.grey,
          ),
        ),
        SizedBox(
          height: 130,
          width: 130,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("23", style: TextStyle(fontSize: 35, color: Colors.orange, fontWeight: FontWeight.bold),),
                Text(" / 47", style: TextStyle(fontSize: 20, color: Colors.grey),),
              ],
            ),
        )
      ],
    );
  }
}

class CheckButton extends StatefulWidget {
  const CheckButton({Key? key}) : super(key: key);

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
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

