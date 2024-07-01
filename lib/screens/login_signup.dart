import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/model/firebase_service.dart';
import 'package:proyecto/palettte.dart';
import 'package:proyecto/screens/screens.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignInScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late Size mediaSize;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    // contenedor para imagen de fondo
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/portada.jpg"),
          //adaptar la imagane a tamañao de la pantalla en el fondo
          fit: BoxFit.cover,
          //darle un filtro a la caja
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      // Scaffold para el contenido principal de la pagina
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          // llamar los widget
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

// Widget para crear el texto de arriba
  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // dar una pequeña separacio al texto
          SizedBox(
            height: 20,
          ),
          Text(
            "Turismo Durango",
            style: kHeading,
          )
        ],
      ),
    );
  }

// Widget que contiene la card donde se pondra el fomulario
  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

// Widget del formulario que se pone encima de la card
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome to Turismo Durango",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 7, 7, 108),
              fontSize: 32,
              fontWeight: FontWeight.w500),
        ),

        // Llamar los widgets para colocarlos de forma ordenada
        const SizedBox(height: 30),
        _buildGreyText("Email"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildRememberForgot(),
      ],
    );
  }

// Widget para darle forma al texto para los input
  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 67, 67, 67)),
    );
  }

  // Widget para crear los input

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
    );
  }

// Widget para el Boton de olvidaste la contraseña
  Widget _buildRememberForgot() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 10),
          ),
          onPressed: () {},
          child: _buildGreyText("Forgot password?"),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 10),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: _buildGreyText("Registrarse"),
        )
      ],
    );
  }

// Widget para el boton
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        try {
          // Inicia sesión con el correo electrónico y la contraseña
          await _auth.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PrincipalScreen()),
          );

          // Puedes usar Navigator.push para navegar a otra pantalla.
        } catch (e) {
          print('Error de inicio de sesión: $e');
          // Maneja el error según tus necesidades
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 13, 66, 190),
        shape: const StadiumBorder(),
        shadowColor: Colors.blueGrey,
        elevation: 20,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("LOGIN"),
    );
  }
}
