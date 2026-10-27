import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../services/cat_service.dart';

class CatProvider extends ChangeNotifier {
  List<Cat> cats = [];
  bool isLoading = false;
  String? error;

  Future<void> loadCats() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final fetchedCats = await CatService().getCats(); 
      
      final List<String> dummyPrices = [
        'Rp 1.500.000',
        'Rp 2.000.000',
        'Rp 1.200.000',
        'Rp 3.500.000',
        'Rp 1.800.000',
        'Rp 2.500.000',
        'Rp 4.000.000',
        'Rp 1.000.000',
      ];

      cats = fetchedCats.asMap().entries.map((entry) {
        int index = entry.key;
        Cat cat = entry.value;
        
        return Cat(
          breed: cat.breed,
          country: cat.country,
          origin: cat.origin,
          coat: cat.coat,
          pattern: cat.pattern,
          price: dummyPrices[index % dummyPrices.length], 
        );
      }).toList();

    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}