// file: lib/domain/repositories/donation_repository.dart
import '../entities/donation.dart';

abstract class DonationRepository {
  Future<void> createDonation(Donation donation);

  Future<List<Donation>> getRecentDonations();
}