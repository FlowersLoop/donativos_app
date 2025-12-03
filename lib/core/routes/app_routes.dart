// file: lib/core/routes/app_routes.dart
import 'package:flutter/material.dart';

import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/donation_form_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String donationForm = '/donation-form';

  static String get initialRoute => login;

  static Map<String, WidgetBuilder> get routes => {
    login: (_) => const LoginScreen(),
    home: (_) => const HomeScreen(),
    donationForm: (_) => const DonationFormScreen(),
  };
}