// file: lib/data/models/donation_model.dart
import '../../domain/entities/donation.dart';

class DonationModel extends Donation {
  const DonationModel({
    required super.id,
    required super.description,
    required super.quantity,
    required super.unit,
    required super.category,
    required super.location,
    required super.createdAt,
  });

  factory DonationModel.fromMap(Map<String, dynamic> map) {
    return DonationModel(
      id: map['id'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
      unit: map['unit'] as String,
      category: map['category'] as String,
      location: map['location'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
    'quantity': quantity,
    'unit': unit,
    'category': category,
    'location': location,
    'createdAt': createdAt.toIso8601String(),
  };
}