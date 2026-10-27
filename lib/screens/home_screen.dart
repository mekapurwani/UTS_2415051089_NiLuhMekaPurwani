import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cat_provider.dart';
import '../widgets/cat_card.dart';
import 'cat_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onSeeAll;

  const HomeScreen({super.key, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CatProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CatAdopt'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFF2A1A15), 
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF28C28), width: 2), 
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Stack(
                  children: [
                    Positioned(
                      right: 150, bottom: -10,
                      child: Icon(Icons.pets, size: 60, color: Colors.white.withValues(alpha: 0.05)),
                    ),
                    Positioned(
                      right: 0, top: 0, bottom: 0, width: 180,
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.transparent, Colors.black],
                          ).createShader(Rect.fromLTRB(0, 0, rect.width / 2, rect.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1543852786-1cf6624b9987?q=80&w=400&auto=format&fit=crop',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, height: 1.2),
                              children: [
                                TextSpan(text: '40% ', style: TextStyle(color: Color(0xFFF28C28))),
                                TextSpan(text: 'Off on Pet\nProducts', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: onSeeAll,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF28C28),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Kategori', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: onSeeAll, 
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: const Text('Lihat Semua', style: TextStyle(color: Color(0xFFF28C28), fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildCategoryItem('Kucing', Icons.pets, isActive: true),
              ],
            ),
            const SizedBox(height: 24),

            provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75, 
                    ),
                    itemCount: provider.cats.length > 4 ? 4 : provider.cats.length,
                    itemBuilder: (context, index) {
                      final cat = provider.cats[index];
                      return CatCard(
                        cat: cat,
                        index: index, 
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CatDetailScreen(cat: cat)));
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String label, IconData icon, {bool isActive = false}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFF28C28) : Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: isActive ? Colors.white : Colors.grey.shade600, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label, 
          style: TextStyle(
            fontSize: 12, 
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal, 
            color: isActive ? Colors.black87 : Colors.grey.shade600
          )
        ),
      ],
    );
  }
}