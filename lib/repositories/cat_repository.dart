import '../models/cat.dart';
import '../services/cat_service.dart';

class CatRepository {
  final CatService _service = CatService();

  Future<List<Cat>> getCats() {
    return _service.getCats();
  }
}