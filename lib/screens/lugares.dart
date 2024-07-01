// Pantalla para Mostrar los lugares turisiticos
import 'package:flutter/material.dart';
import 'package:proyecto/screens/detalles_screen.dart';
import 'package:proyecto/screens/favoritos.dart';
// import 'package:proyecto/screens/favoritos.dart';
import 'package:proyecto/widgets/Navbar.dart';

class LugaresScreen extends StatefulWidget {
  const LugaresScreen({super.key});

  @override
  State<LugaresScreen> createState() => LugaresPage();
}

class LugaresPage extends State<LugaresScreen> {
  // Lista de lugares favoritos
  Set<String> lugaresFavoritos = {};
  // Lista con las fotos, nombre y la descripcion de cada card que se usara en este espacio
  List fotoCard = [
    {
      // Imasgen Catedral
      'imageRef': 'images/l-molinillos.jpg',
      'name': 'Molinillos',
      'description':
          'En medio de los bosques de Durango se encuentra Molinillos Mountain Resort, uno de los centros ecoturísticos más visitados en el norte del País y desde 2017 el más importante del Estado de Durango.​'
    },
    {
      // Imagen Bebeleche
      'imageRef': 'images/l-tecuan.jpg',
      'name': 'Parque Tecuan',
      'description':
          'A sólo 40 minutos de la capital en medio de la sierra, es el lugar ideal para que los amantes de la naturaleza se relajen en medio de este ambiente natural. Podrás realizar un buen número de actividades al aire libre: caminatas, pesca, ciclismo, campismo y más. Además puedes observar ardillas, venados elk, coyotes, lobos, zorros, entre muchos animales.'
    },
    {
      // Imagen Parque Guadiana
      'imageRef': 'images/l-mexiquilllo.jpg',
      'name': 'Mexiquillo',
      'description':
          'Mexiquillo es un parque natural ubicado al oeste del estado de Durango, México en el municipio de Pueblo Nuevo, sobre la Sierra Madre Occidental. Es el paraje natural más visitado del estado y uno de los de mayor atractivo.'
    },
    {
      // Imagen Centro Historico
      'imageRef': 'images/l-ojuela.jpg',
      'name': 'Puente Ojuela',
      'description':
          '¡Atraviesa un puente de 315 metros de largo y mira el fondo de la barranca cien metros abajo! ¿Te atreves?'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lugares'),
        ),
        drawer: const NavScreen(),
        extendBodyBehindAppBar: false,
        body: ListView(padding: EdgeInsets.zero, children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            textAlign: TextAlign.center,
            'Explora y agrega tus lugares Favoritos',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.addressCityAndState,
                fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          // Mapear el Arreglo fotoCard
          for (var fotolugar in fotoCard)
            // Widget para interactuar de forma dinamica con el usuario
            GestureDetector(
              onTap: () {
                _mostrarDetalle(context, fotolugar);
              },
              // llamar clase donde se muestra el formato de las imagenes
              child: NewLugares(
                imageRef: fotolugar['imageRef'],
                description: fotolugar['description'],
                name: fotolugar['name'],
                isFavorite: lugaresFavoritos.contains(fotolugar['name']),
                onFavoriteToggle: () {
                  guardarFavorito(fotolugar['name']);
                },
              ),
            ),
          ElevatedButton(
            onPressed: _mostrarLugaresFavoritos,
            child: const Text('Mostrar Lugares Favoritos'),
          ),
        ]));
  }

  // Función para manejar funcion de tocar el ícono de "Me Gusta"
  void guardarFavorito(String lugarName) {
    setState(() {
      if (lugaresFavoritos.contains(lugarName)) {
        lugaresFavoritos.remove(lugarName);
      } else {
        lugaresFavoritos.add(lugarName);
      }
    });
  }

// Funcion para mandar nombre de los lugares presionados al archivo favoritos.dart
  void _mostrarLugaresFavoritos() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritoScreen(
          lugaresFavoritos: lugaresFavoritos,
        ),
      ),
    );
  }
}

// Clase para poner nuevos automatico en opciones
class NewLugares extends StatelessWidget {
  final String imageRef;
  final String description;
  final String name;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const NewLugares({
    super.key,
    required this.imageRef,
    required this.description,
    required this.name,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Contenido de la imagen
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          // height: MediaQuery.of(context).size.height * .1,
          // width: MediaQuery.of(context).size.width * 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageRef,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
          ),
        ),

        // Descripcion del contenido

        Text(
          name,
          overflow: TextOverflow.clip,
          maxLines: 2,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),

        // Icono de "Me Gusta"
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: onFavoriteToggle,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

// Funcion para Mostrar Interfaz con Informacion mandando parametros a detalles_screen.dart
void _mostrarDetalle(BuildContext context, Map<String, String> foto) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetalleScreen(
        imageRef: foto['imageRef'],
        name: foto['name'],
        description: foto['description'],
      ),
    ),
  );
}
