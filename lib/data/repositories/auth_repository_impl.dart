// file: lib/data/repositories/auth_repository_impl.dart
import 'dart:async';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  User? _currentUser;

  @override
  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    // TODO: reemplazar por FirebaseAuth en siguiente fase
    await Future.delayed(const Duration(seconds: 1)); // simula red

    _currentUser = UserModel(
      id: 'dummy-id',
      name: 'Voluntario Demo',
      email: email,
    );
    return _currentUser!;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _currentUser = null;
  }

  @override
  Stream<User?> authStateChanges() async* {
    yield _currentUser;
  }
}