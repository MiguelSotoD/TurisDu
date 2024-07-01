import 'package:flutter/material.dart';
import 'package:proyecto/screens/screens.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalPage();
}

class _PrincipalPage extends State<PrincipalScreen> {
  // Declarar variable inicial de la posicion de nuestro BottomNavigationBar
  int myCurrentIndex = 0;
  // Crear una lista de las pages que usaremos de forma secuencial(1..2..3..)
  List pages = const [
    HomeScreen(),
    LugaresScreen(),
    MapaScreen(),
    CentroScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Se mostrara en el body la pagina que se declare en nuestra variable
        body: pages[myCurrentIndex],
        // Contenedor para todo nuestro boton de navegacion
        bottomNavigationBar: Container(
          // Dar una sombra al contorno
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 25)
          ]),
          child:
              // ClipRRect Widget
              ClipRRect(
            child: BottomNavigationBar(
                // Manejar un estado segun la posicion de nuestro Item seleccionado cambia de pagina
                onTap: (index) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
                // elevation: 0,
                // Posicion  del item seleccionado
                currentIndex: myCurrentIndex,
                backgroundColor: Colors.white,
                // Color del item Seleccionado
                selectedItemColor: Colors.deepPurple,
                // Color del item no seleccionado
                unselectedItemColor: Colors.blue,
                items: const [
                  // Creaciones de los iconos y label flotante
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Inicio'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_balance), label: 'Lugares'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map_outlined),
                    label: 'Mapa',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.contact_phone_rounded),
                      label: 'Contacto'),
                ]),
          ),
        ));
  }
}
