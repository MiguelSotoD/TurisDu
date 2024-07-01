import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/palettte.dart';
import 'package:proyecto/screens/screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late Size mediaSize;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/portada.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Create an Account",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 7, 7, 108),
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 30),
        _buildGreyText("Name"),
        _buildInputField(nameController),
        const SizedBox(height: 20),
        _buildGreyText("Email"),
        _buildInputField(emailController),
        const SizedBox(height: 20),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildGreyText("Confirm Password"),
        _buildInputField(confirmPasswordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRegisterButton(),
        const SizedBox(height: 20),
        _buildRememberLogin(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 67, 67, 67)),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
    );
  }

  Widget _buildRememberLogin() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 10),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            );
          },
          child: _buildGreyText("Already have an account? Log In"),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _performRegistration,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 13, 66, 190),
        shape: const StadiumBorder(),
        shadowColor: Colors.blueGrey,
        elevation: 20,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("REGISTER"),
    );
  }

  void _performRegistration() async {
    // Validar los campos antes de registrar
    if (_validateFields()) {
      try {
        // Obtener una referencia a la colección 'usuarios' en Firestore
        CollectionReference users =
            FirebaseFirestore.instance.collection('usuarios');

        // Añadir un nuevo documento con la información del usuario
        await users.add({
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text
          // Puedes agregar más campos según tus necesidades
        });

        // Navegar a la pantalla principal después del registro exitoso
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      } catch (e) {
        // Manejar errores en el registro
        print('Error en el registro: $e');
      }
    } else {
      // Mostrar un mensaje de error o manejar campos no válidos
    }
  }

  bool _validateFields() {
    // Validar los campos antes de registrar
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text;
  }
}
