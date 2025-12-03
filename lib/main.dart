// file: lib/main.dart
import 'package:flutter/material.dart';

import 'core/app.dart';
import 'di/providers.dart';

void main() {
  runApp(const DonativosRoot());
}

class DonativosRoot extends StatelessWidget {
  const DonativosRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: const DonativosApp(),
    );
  }
}