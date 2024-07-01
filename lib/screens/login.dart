import 'package:flutter/material.dart';
// import 'package:proyecto/screens/login_signup.dart';
import 'package:proyecto/screens/screens.dart';
import '../widgets/widgets.dart';
import 'package:proyecto/palettte.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Backgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(children: [
              const SizedBox(
                height: 450,
                child: Center(
                  child: Text(
                    'Turismo Durango',
                    style: kHeading,
                  ),
                ),
              ),

              // Espaciado
              const SizedBox(
                height: 50,
              ),
              // Boton de Login
              Column(
                children: [
                  Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // Boton para Iniciar Sesion y Registrarse
                    child: TextButton(
                      onPressed: () {
                        // Dirigir A pagina login_signup.dart
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                        );
                      },
                      child: const Text(
                        'Login In',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              //Espaciado
              const SizedBox(
                height: 50,
              ),
              // Link por si no tiene cuenta
              const Text(
                'No tienes cuenta aun?',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 13),
                      foregroundColor: Colors.red),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text("Registrarse")),
            ]),
          ),
        ),
      ],
    );
  }
}
