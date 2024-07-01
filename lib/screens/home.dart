import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista de imágenes para las cards de ExposicionCards
  List fotosSeccion1 = [
    {
      // Imasgen Catedral
      'imageRef': 'images/durango-back.jpeg',
      'name': 'Catedral de Durango',
      'description':
          'La Catedral Basílica Menor de la Inmaculada Concepción, pertenece a la arquidiócesis de Durango. Se ubica en el centro histórico de la ciudad de Victoria de Durango, frente a la Plaza de Armas. Es la representación arquitectónica más importante del estado, y una de las edificaciones más bellas del norte del país. Ocupa el lugar de la antigua parroquia de la Asunción.​'
    },
    {
      // Imagen Bebeleche
      'imageRef': 'images/mbebeleche.jpg',
      'name': 'Museo Bebeleche',
      'description':
          'En este museo se presentan exposiciones educativas e interactivas para pequeños y grandes, se aprende de ciencia, arte y sobre el Estado de Durango. Lo componen cinco salas temáticas: Conocer, Vivir, Jugar, Crecer y Crear, en las que existen un sin fín de juegos educativos .Cuenta además con una sala de exposiciones temporales, una sala 3D y una tienda de souvenirs. Frecuentemente se llevan a cabo talleres artesanales y educativos.'
    },
    {
      // Imagen Parque Guadiana
      'imageRef': 'images/parquedgo.jpg',
      'name': 'Parque Guadiana',
      'description':
          'El nacimiento del Parque Guadiana, considerado el área natural más importante de la ciudad de Durango, se remonta a las primeras décadas del siglo XX, y con el tiempo se convirtió en un sitio entrañable para la gente por sus abundantes árboles de eucalipto, sauces, álamos y otras especies que conforman un invaluable pulmón verde de la ciudad y el ambiente perfecto para organizar días de campo con familia o amistades.'
    },
    {
      // Imagen Centro Historico
      'imageRef': 'images/durangonight.jpg',
      'name': 'Centro Historico',
      'description':
          'El centro histórico de Durango es la zona de monumentos históricos de la ciudad de Victoria de Durango en el estado homónimo en México, declarado por el Instituto Nacional de Antropología e Historia (INAH).1​ A su vez también fue declarado por la UNESCO como parte del Camino Real de Tierra Adentro, que fue reconocido como Patrimonio de la Humanidad en 20102'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      // Extender todo el body quitando el appbar
      extendBodyBehindAppBar: true,
      drawer: const NavScreen(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const ImageContainer(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            textAlign: TextAlign.center,
            'Conoce estos Lugares',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.addressCityAndState,
                fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          // Mapear la lista de fotos y crear instancias de ExposicionCards
          for (var foto in fotosSeccion1)
            GestureDetector(
              onTap: () {
                _mostrarDetalle(context, foto);
              },
              child: ExposicionCards(
                imageRef: foto['imageRef'],
                description: foto['name'],
              ),
            )
        ],
      ),
    );
  }
}

// Clase para imagen de presentacion con texto parte Superior
class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage('images/durangocity.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
          // Texto Grande Centrado
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'Turismo Durango',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Texto pequeño centrado debajo del texto grande
          Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  'Conoce los mejores sitios en Durango y vive la Experiencia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 1.5,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

// Clase para imagenes de lugares parte inferior
class ExposicionCards extends StatelessWidget {
  // Decalarra variables para nuestra seccion
  final String imageRef;
  final String description;
  // Requerir 2 parametros para nuestras variables
  const ExposicionCards(
      {super.key, required this.imageRef, required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Contenido de la imagen
        Container(
          margin: const EdgeInsets.all(5),
          height: 300,
          width: 350,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageRef,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Descripcion del contenido

        Positioned(
          top: 10,
          width: 220,
          child: SizedBox(
            width: 250,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            // margin: const EdgeInsets.all(10),
            child: Text(
              description,
              overflow: TextOverflow.clip,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Funcion para Mostrar Interfaz con Informacion
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
