import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../repositories/cat_repository.dart';

class CatProvider extends ChangeNotifier {
  final CatRepository _repository = CatRepository();

  List<Cat> cats = [];
  bool isLoading = false;
  String? error;

  Future<void> loadCats() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      cats = await _repository.getCats();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}