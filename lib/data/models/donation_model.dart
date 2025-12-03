// file: lib/data/models/donation_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory DonationModel.fromMap(Map<String, dynamic> map, String id) {
    // createdAt puede venir como Timestamp o como String
    final createdAtField = map['createdAt'];
    DateTime createdAt;

    if (createdAtField is Timestamp) {
      createdAt = createdAtField.toDate();
    } else if (createdAtField is String) {
      createdAt = DateTime.parse(createdAtField);
    } else {
      createdAt = DateTime.now();
    }

    return DonationModel(
      id: id,
      description: map['description'] as String? ?? '',
      quantity: (map['quantity'] as num?)?.toInt() ?? 0,
      unit: map['unit'] as String? ?? '',
      category: map['category'] as String? ?? '',
      location: map['location'] as String? ?? '',
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() => {
    'description': description,
    'quantity': quantity,
    'unit': unit,
    'category': category,
    'location': location,
    // Firestore lo va a guardar como Timestamp
    'createdAt': createdAt,
  };
}