import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'edit_adoption_screen.dart'; 

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> adopsiList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAdopsi();
  }

  Future<void> _loadAdopsi() async {
    try {
      final data = await supabase.from('adoptions').select().order('id', ascending: false);
      setState(() {
        adopsiList = List<Map<String, dynamic>>.from(data);
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  Future<void> _hapusAdopsi(int id) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin ingin menghapus data adopsi ini?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (konfirmasi == true) {
      await supabase.from('adoptions').delete().eq('id', id);
      _loadAdopsi();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil dihapus'), backgroundColor: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Adopsi')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFFF28C28)))
          : adopsiList.isEmpty
              ? const Center(child: Text('Belum ada kucing yang diadopsi.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: adopsiList.length,
                  itemBuilder: (context, index) {
                    final item = adopsiList[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFFDE8D7),
                          child: Icon(Icons.favorite, color: Color(0xFFF28C28)),
                        ),
                        title: Text(item['cat_name'] ?? 'Tanpa Nama', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${item['breed']} • ${item['location']}\n${item['description']}'),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // TOMBOL EDIT (PENSIL)
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () async {
                                final updated = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditAdoptionScreen(adopsiData: item),
                                  ),
                                );
                                if (updated == true) _loadAdopsi(); 
                              },
                            ),
                            
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _hapusAdopsi(item['id']),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}