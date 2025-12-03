// file: lib/data/repositories/donation_repository_impl.dart
import 'dart:async';
import 'package:flutter/foundation.dart';

import '../../domain/entities/donation.dart';
import '../../domain/repositories/donation_repository.dart';

class DonationRepositoryImpl implements DonationRepository {
  final List<Donation> _donations = [];

  @override
  Future<void> createDonation(Donation donation) async {
    await Future.delayed(const Duration(milliseconds: 400));
    _donations.add(donation);

    if (kDebugMode) {
      print('[DonationRepositoryImpl] Donativo creado: ${donation.description}');
    }
  }

  @override
  Future<List<Donation>> getRecentDonations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _donations.reversed.toList();
  }
}