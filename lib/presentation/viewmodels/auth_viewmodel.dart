// file: lib/presentation/viewmodels/auth_viewmodel.dart
import 'package:flutter/foundation.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in_usecase.dart';

enum AuthStatus {
  idle,
  loading,
  authenticated,
  error,
}

class AuthViewModel extends ChangeNotifier {
  final SignInUseCase signInUseCase;

  AuthViewModel({required this.signInUseCase});

  AuthStatus _status = AuthStatus.idle;
  AuthStatus get status => _status;

  User? _user;
  User? get user => _user;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> signIn(String email, String password) async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await signInUseCase(
        email: email,
        password: password,
      );
      _user = result;
      _status = AuthStatus.authenticated;
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = 'No se pudo iniciar sesión. Intenta de nuevo.';
      if (kDebugMode) {
        print('Error en signIn: $e');
      }
    }

    notifyListeners();
  }

  void reset() {
    _status = AuthStatus.idle;
    _errorMessage = null;
    notifyListeners();
  }
}