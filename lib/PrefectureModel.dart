class PrefectureModel {
  final String name;

  const PrefectureModel({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
    };
  }

  // データの中身を確認しやすいように
  @override
  String toString() {
    return "Prefecture{name: $name}";
  }
}