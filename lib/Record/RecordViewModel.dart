import 'package:flutter/material.dart';
import 'package:next_trip_decider/Record/PrefectureRepository.dart';
import '../PrefectureModel.dart';

class RecordViewModel extends ChangeNotifier {
  final PrefectureRepository _repository;
  List<PrefectureModel> _prefectures = [];
  List<PrefectureModel> get prefectures => _prefectures;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RecordViewModel(this._repository) {
    loadAllPrefectures();
  }

  void loadAllPrefectures() async {
    _startLoading();
    _prefectures = await _repository.loadAllPrefecture();
    _finishLoading();
  }

  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _finishLoading() {
    _isLoading = false;
    notifyListeners();
  }
}