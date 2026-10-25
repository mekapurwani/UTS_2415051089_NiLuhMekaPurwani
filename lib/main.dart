import 'package:flutter/material.dart';
import 'services/cat_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Test API Kucing')),
        body: FutureBuilder(
          future: CatService().getCats(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final cats = snapshot.data!;
            return ListView.builder(
              itemCount: cats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cats[index].breed),
                  subtitle: Text(cats[index].country),
                );
              },
            );
          },
        ),
      ),
    );
  }
}