import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto/screens/screens.dart';

class CentroScreen extends StatelessWidget {
  const CentroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const NavScreen(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage('images/centro.jpg'),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black54, BlendMode.darken),
                    ),
                  ),
                ),
                const Positioned(
                  top: 35,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Centro de Ayuda',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                      child: Text('Hola. ¿En qué le podemos ayudar?',
                          style: TextStyle(fontSize: 25))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // Implementa la lógica para el manejo de la búsqueda.
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Preguntas Frecuentes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('¿Cómo llegar a Durango?'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('¿Cuáles son los lugares turísticos?'),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contacto',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('Correo Electrónico'),
                  subtitle: const Text('info@turismodurango.com'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Número de Teléfono'),
                  subtitle: const Text('+52 123 456 789'),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                //Aplicacion de los iconos
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.facebook)),
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.instagram)),
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.youtube)),
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.envelope)),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
