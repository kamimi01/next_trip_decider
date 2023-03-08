import 'package:next_trip_decider/DatabaseHelper.dart';
import 'package:next_trip_decider/PrefectureModel.dart';

class PrefectureRepository {
  final DatabaseHelper _database;

  PrefectureRepository(this._database);

  Future<List<PrefectureModel>> loadAllPrefecture() => _database.prefectures();

  void insert(PrefectureModel prefecture) => _database.insert(prefecture);

  Future<void> delete(String name) => _database.delete(name);
}