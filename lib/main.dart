// Importacion del paquete IMPORTANTE
// Aplicacion Creada por: José Uriel Contreras Arevalos Y José Miguel Soto Diaz
import 'package:flutter/material.dart';
import 'package:proyecto/router/app_router.dart';
import 'package:proyecto/theme/theme.dart';

// importacion bd
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turismo Durango',
      debugShowCheckedModeBanner: false,
      // Generar las rutas dinamicas del archivvo app_router
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.getAppRoutes(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      // llamar tema para aplicar en todo el documento
      theme: AppTheme.TemaApp,
    );
  }
}
