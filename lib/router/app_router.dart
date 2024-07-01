import 'package:flutter/material.dart';
import 'package:proyecto/model/menu_options.dart';
import 'package:proyecto/screens/screens.dart';

class AppRouter {
  // Crear Ruta Inicial
  // Crear objeto que contendra las rutas para acceder a los diferentes screens

  static const initialRoute = 'menu';
  static final menuOptions = <MenuOptions>[
    MenuOptions(
        route: 'home',
        icon: Icons.home,
        name: 'Inicio',
        screen: const PrincipalScreen()),
    MenuOptions(
        route: 'perfil',
        icon: Icons.account_circle,
        name: 'Perfil',
        screen: const PerfilScreen()),
    MenuOptions(
        route: 'sesion',
        icon: Icons.exit_to_app,
        name: 'Cerrar Sesion',
        screen: const Login()),
    // MenuOptions(
    //     route: 'configuraciones',
    //     icon: Icons.settings,
    //     name: 'Configuraciones',
    //     screen: const ConfiguracionesScreen()),
    // MenuOptions(
    //     route: 'salir',
    //     icon: Icons.group_remove,
    //     name: 'Cerrar Sesion',
    //     screen: const ConfiguracionesScreen()),
  ];

// Crear Mapa para regresar ruta correcta de acuerdo al objeto de rutas
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'menu': (BuildContext context) => const Login()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // Crear o Generar ruta adicional si no encuentra la ruta inicial

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
