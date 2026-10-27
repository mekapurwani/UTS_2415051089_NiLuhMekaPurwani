import 'package:flutter/material.dart';
import '../models/cat.dart';

class CatCard extends StatelessWidget {
  final Cat cat;
  final VoidCallback onTap;
  final int index; 

  const CatCard({super.key, required this.cat, required this.onTap, this.index = 0});

  @override
  Widget build(BuildContext context) {
    final List<Color> pastelColors = [
      const Color(0xFFE5DAFF), 
      const Color(0xFFFBD3CB), 
      const Color(0xFFFFE5CC), 
      const Color(0xFFD4E8D4), 
    ];
    final Color cardColor = pastelColors[index % pastelColors.length];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor, 
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.network(
                  cat.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.grey.shade200, child: const Icon(Icons.pets));
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cat.breed, 
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cat.price, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: Color(0xFFF2855C))),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 12, color: Colors.black54),
                            const SizedBox(width: 2),
                            const Text('Bali', style: TextStyle(fontSize: 11, color: Colors.black54)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}