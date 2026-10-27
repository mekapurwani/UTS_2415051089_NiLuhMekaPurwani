import 'package:flutter/material.dart';

class IdentityHeader extends StatelessWidget {
  const IdentityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFF2E8DA),
        border: Border(bottom: BorderSide(color: Color(0xFFE0D4C3), width: 1)),
      ),
      child: const Text(
        '2415051089 • Ni Luh Meka Purwani',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF8B6F58),
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }
}