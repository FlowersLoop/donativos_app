import 'package:flutter/material.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Escáner QR (en desarrollo)',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}