// Archivo para exportar todos los contenidos de archivos

export 'package:proyecto/screens/mapa.dart';
export 'package:proyecto/screens/alert_screen.dart';
export 'package:proyecto/screens/login.dart';
export 'package:proyecto/screens/login_signup.dart';
export 'package:proyecto/screens/perfil.dart';
export 'package:proyecto/screens/principal.dart';
export 'package:proyecto/screens/home.dart';
export 'package:proyecto/widgets/navbar.dart';
export 'package:proyecto/screens/detalles_screen.dart';
export 'package:proyecto/screens/configuracione.dart';
export 'package:proyecto/screens/lugares.dart';
export 'package:proyecto/screens/centro_ayuda.dart';
export 'package:proyecto/screens/favoritos.dart';
export 'package:proyecto/screens/register.dart';

import 'package:flutter/material.dart';

class Screens extends StatelessWidget {
  const Screens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
        ),
        body: const Center(
          child: Text('Screens'),
        ));
  }
}
