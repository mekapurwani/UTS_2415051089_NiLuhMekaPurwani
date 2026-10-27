import 'package:flutter/material.dart';
import 'cat_list_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(onSeeAll: () => setState(() => currentIndex = 1)), 
      const CatListScreen(),
      const Center(child: Text('Favorit (Segera Hadir)')),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() => currentIndex = index);
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFFFE5CC), 
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: Color(0xFFF28C28)), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.pets_outlined), selectedIcon: Icon(Icons.pets, color: Color(0xFFF28C28)), label: 'cats'),
          NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite, color: Color(0xFFF28C28)), label: 'Favorit'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person, color: Color(0xFFF28C28)), label: 'Profile'),
        ],
      ),
    );
  }
}