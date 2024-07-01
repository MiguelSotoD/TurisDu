// Pagina Home principal de la aplicacion
// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto/widgets/navbar.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({super.key});

  @override
  State<MapaScreen> createState() => MapSampleState();
}

class MapSampleState extends State<MapaScreen> {
  // Declarar variable para la longitud y latitud inicial donde se ubicara el mapa
  final camarainicialposition =
      const CameraPosition(target: LatLng(24.0246529, -104.6453333), zoom: 13);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // crear menu despegable
      appBar: AppBar(),
      drawer: const NavScreen(),
      //cuerpo de la pagina
      extendBodyBehindAppBar: true,
      body:
          // Uso del Widget Google Map
          GoogleMap(
        initialCameraPosition:
            camarainicialposition, //enfoque inicial de la camara
        myLocationButtonEnabled:
            false, //quitar para mostrar boton que nos diriga a nuestra ubicacion inicial
        mapType: MapType.hybrid, //tipo de mapa que se muestra
      ),
    );
  }
}
