import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cat_provider.dart';
import 'screens/main_navigation_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CatProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CatPedia',
      home: const MainNavigationPage(),
    );
  }
}