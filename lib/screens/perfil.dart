import 'package:flutter/material.dart';
import 'package:proyecto/screens/screens.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
      ),
      // llamar widget del menu
      drawer: const NavScreen(),
      body: Padding(
        // dar espaciado a todo
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // alinear el contenido en el centro
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/uriel-foto.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'UrielCon',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Correo electrónico: root@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // boton para editar el perfil
            ElevatedButton(
              onPressed: () {},
              child: const Text('Editar Perfil'),
            ),

            const SizedBox(height: 16),
            // Lista para agregar o editar informacion adicional
            ListTile(
              title: const Text('Información Adicional'),
              subtitle: const Text('Añade más información sobre ti'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Valida tu Correo'),
              subtitle:
                  const Text('Necesitamos que valides tu Correo Electronico'),
              trailing: const Icon(Icons.sim_card_alert_rounded),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Preferencias'),
              subtitle: const Text('Añade preferencias de lugares'),
              trailing: const Icon(Icons.room_preferences_rounded),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
