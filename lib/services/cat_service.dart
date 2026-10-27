import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/cat.dart';

class CatService {
  Future<List<Cat>> getCats() async {
    try {
      final response = await http.get(Uri.parse('https://catfact.ninja/breeds?limit=10'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> list = data['data'];
        
        debugPrint('=== API BERHASIL: Dapat ${list.length} data ===');
        return list.map((json) => Cat.fromJson(json)).toList();
      } else {
        debugPrint('=== API GAGAL: Status ${response.statusCode} ===');
        throw Exception('Gagal mengambil data kucing');
      }
    } catch (e) {
      debugPrint('=== ERROR API: $e ===');
      throw Exception(e.toString());
    }
  }
}