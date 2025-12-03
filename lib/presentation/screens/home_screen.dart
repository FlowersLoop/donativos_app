// file: lib/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/auth_viewmodel.dart';
import '../widgets/dashboard_stat_card.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature estará disponible en las próximas versiones.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authVm = context.watch<AuthViewModel>();
    final userName = authVm.user?.name ?? 'Voluntario';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de voluntario'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saludo
              Text(
                'Hola, $userName',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Gracias por apoyar en la gestión de donativos ante desastres.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 24),

              // Sección: resumen rápido
              Text(
                'Resumen de hoy',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),

              Column(
                children: const [
                  DashboardStatCard(
                    icon: Icons.inventory_2_outlined,
                    title: 'Donativos registrados',
                    value: '24',
                    subtitle: 'En las últimas 24 horas',
                  ),
                  SizedBox(height: 12),
                  DashboardStatCard(
                    icon: Icons.local_shipping_outlined,
                    title: 'Entregas pendientes',
                    value: '7',
                    subtitle: 'Rutas asignadas hoy',
                  ),
                  SizedBox(height: 12),
                  DashboardStatCard(
                    icon: Icons.people_outline,
                    title: 'Comunidades atendidas',
                    value: '5',
                    subtitle: 'En esta jornada',
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Sección: acciones rápidas
              Text(
                'Acciones rápidas',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),

              PrimaryButton(
                text: 'Escanear QR de donativo',
                onPressed: () => _showComingSoon(context, 'Escanear QR'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () =>
                    _showComingSoon(context, 'Registro manual de donativo'),
                icon: const Icon(Icons.add),
                label: const Text('Registrar donativo manual'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () =>
                    _showComingSoon(context, 'Inventario de almacén'),
                icon: const Icon(Icons.list_alt_outlined),
                label: const Text('Ver inventario'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          // Más adelante aquí navegamos a otras secciones
          _showComingSoon(context, 'Navegación');
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: 'Escanear',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}