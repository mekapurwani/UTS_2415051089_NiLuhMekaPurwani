import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cat_provider.dart';
import '../widgets/cat_card.dart';
import 'cat_detail_screen.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  State<CatListScreen> createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final provider = context.read<CatProvider>();
        if (provider.cats.isEmpty) {
          provider.loadCats();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Kucing')),
      body: Consumer<CatProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFF28C28)));
          }
          if (provider.error != null) {
            return Center(child: Text('Error: ${provider.error}'));
          }
          if (provider.cats.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum ada data kucing dari API.'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => provider.loadCats(),
                    child: const Text('Muat Ulang'),
                  )
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemCount: provider.cats.length,
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
          );
        },
      ),
    );
  }
}