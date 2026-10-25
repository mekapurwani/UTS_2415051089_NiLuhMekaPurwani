import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat.dart';

class CatService {
  final String baseUrl = 'https://catfact.ninja';

  Future<List<Cat>> getCats() async {
    final response = await http.get(Uri.parse('$baseUrl/breeds?limit=20'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> catsData = data['data'];
      
      return catsData.map((json) => Cat.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Gagal mengambil data kucing');
    }
  }
}