import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/cat_provider.dart';
import 'screens/main_navigation_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CatProvider()..loadCats(), 
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme appTextTheme = TextTheme(
      titleLarge: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black87),
      titleMedium: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
      bodyMedium: GoogleFonts.nunito(fontSize: 14, color: Colors.black54),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CatAdopt',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF28C28),
          primary: const Color(0xFFF28C28),
          surface: Colors.white,
        ),
        useMaterial3: true,
        textTheme: appTextTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black87),
        ),
      ),
      home: const MainNavigationPage(),
    );
  }
}