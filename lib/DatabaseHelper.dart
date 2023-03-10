import 'dart:io';
import 'package:next_trip_decider/PrefectureModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "NextTripDecider.db";
  static const _databaseVersion = 1;

  static const table = "prefecture";

  static const columnName = "name";

  // シングルトンにする
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // Database が存在するかチェックして、なければ新規作成、あれば既存のものを渡す
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return openDatabase(
        join(await getDatabasesPath(), _databaseName),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE $table($columnName TEXT)"
          );
        },
        version: _databaseVersion
    );
  }

  // 追加する
  void insert(PrefectureModel prefecture) async {
    if (_database == null) { return; }
    await _database!.insert(
        table,
        prefecture.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // 同じデータがあったら、置き換える
    );
  }

  // 削除する
  Future<void> delete(String name) async {
    if (_database == null) {
      return;
    }

    await _database!.delete(
      table,
      where: "$columnName = ?",
      whereArgs: [name]
    );
  }

  // 取得する
  Future<List<PrefectureModel>> prefectures() async {
    if (_database == null) {
      return [];
    }
    final List<Map<String, dynamic>> maps = await _database!.query(table);

    return List.generate(maps.length, (index) {
      return PrefectureModel(
        name: maps[index][columnName],
      );
    });
  }
}