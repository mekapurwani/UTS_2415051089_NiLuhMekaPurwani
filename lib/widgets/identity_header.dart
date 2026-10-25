import 'package:flutter/material.dart';

class IdentityHeader extends StatelessWidget {
  const IdentityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Colors.blue.shade50,
      child: const Text(
        '2415051089 - Ni Luh Meka Purwani',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}