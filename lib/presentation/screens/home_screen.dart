// file: lib/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de donativos'),
      ),
      body: const Center(
        child: Text(
          'Aquí irá el dashboard de inventario, donativos, etc.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}