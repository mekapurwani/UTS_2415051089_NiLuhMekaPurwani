import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cat_provider.dart';
import '../widgets/identity_header.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  State<CatListScreen> createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  @override
  void initState() {
    super.initState();
    // Panggil data saat halaman pertama kali dibuka
    Future.microtask(() => context.read<CatProvider>().loadCats());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CatProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cat List')),
      body: Column(
        children: [
          const IdentityHeader(),
          Expanded(
            child: _buildBody(provider),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(CatProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }
    if (provider.cats.isEmpty) {
      return const Center(child: Text('Belum ada data kucing.'));
    }

    return ListView.builder(
      itemCount: provider.cats.length,
      itemBuilder: (context, index) {
        final cat = provider.cats[index];
        return ListTile(
          leading: const Icon(Icons.pets, color: Colors.blue),
          title: Text(cat.breed),
          subtitle: Text(cat.country),
        );
      },
    );
  }
}