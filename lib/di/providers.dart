// file: lib/di/providers.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/sign_in_usecase.dart';
import '../presentation/viewmodels/auth_viewmodel.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Repositorios concretos
        Provider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(),
        ),

        // Casos de uso
        ProxyProvider<AuthRepository, SignInUseCase>(
          update: (_, authRepo, __) =>
              SignInUseCase(authRepository: authRepo),
        ),

        // ViewModels
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(
            signInUseCase:
            Provider.of<SignInUseCase>(context, listen: false),
          ),
        ),
      ],
      child: child,
    );
  }
}