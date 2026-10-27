import 'package:flutter/material.dart';
import '../models/cat.dart';

class CatDetailScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5EE),
      body: Stack(
        children: [
          // Gambar Kucing di Atas
          Positioned(
            top: 0, left: 0, right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.network(
              cat.imageUrl, 
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.grey.shade300, child: const Icon(Icons.pets, size: 80, color: Colors.grey));
              },
            ),
          ),
          
          // Tombol Back
          Positioned(
            top: 50, left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.38,
            left: 0, right: 0, bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    
                      Text(
                        cat.breed, 
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black87),
                      ),
                    
                      Text(
                        cat.price, 
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFFF2855C)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
      
                      Text(cat.country, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  Row(
                    children: [
                      _buildTag(cat.origin, const Color(0xFFFFE5CC)), 
                      const SizedBox(width: 12),
                      _buildTag(cat.coat, const Color(0xFFE5DAFF)), 
                      const SizedBox(width: 12),
                      _buildTag(cat.pattern, const Color(0xFFD4E8D4)), 
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  const Text('Tentang Kucing', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                
                    'Kucing ini adalah ras ${cat.breed} yang berasal dari ${cat.country}. Memiliki jenis bulu ${cat.coat} dengan pola ${cat.pattern}. Sangat ramah dan cocok untuk diadopsi menjadi teman di rumah.',
                    style: TextStyle(color: Colors.grey.shade700, height: 1.5, fontSize: 14),
                  ),
                  
                  const Spacer(),
                  
                  SizedBox(
                    width: double.infinity, height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                  
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${cat.breed} ditambahkan ke daftar adopsi!'))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF2855C),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('Adopsi Sekarang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black87)),
    );
  }
}