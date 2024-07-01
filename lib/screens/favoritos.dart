import 'package:flutter/material.dart';
import 'package:proyecto/widgets/Navbar.dart';

// Clase para retornar una lista con los lugares favoritos agregados
class FavoritoScreen extends StatelessWidget {
  final Set<String> lugaresFavoritos;
  const FavoritoScreen({super.key, required this.lugaresFavoritos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        // foregroundColor: Colors.amber,
        title: const Text('Lugares Favoritos'),
      ),
      drawer: const NavScreen(),
      body: ListView(
        children: lugaresFavoritos.map((lugar) {
          return ListTile(
            title: Text(lugar),
          );
        }).toList(),
      ),
    );
  }
}
