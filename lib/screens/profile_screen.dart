import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFFA500), width: 3),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/Profil catpedia.png'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Ni Luh Meka Purwani',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            const Text(
              'NIM: 2415051089 • Kelas: PTI 5A',
              style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.info_outline, color: Color(0xFFFFA500)),
                          SizedBox(width: 12),
                          Text('Tentang Aplikasi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'CatAdopt adalah aplikasi yang membantu menemukan rumah baru yang penuh kasih sayang untuk kucing-kucing yang membutuhkan.',
                        textAlign: TextAlign.start, 
                        style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}