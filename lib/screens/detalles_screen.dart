import 'package:flutter/material.dart';

class DetalleScreen extends StatelessWidget {
  // definir las variables de los paramatros que recibimos de la pagina home y favoritos
  final String? imageRef;
  final String? name;
  final String? description;

  const DetalleScreen({Key? key, this.imageRef, this.description, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        // mandar el parametro name a la clase CustomAppBar
        child: CustomAppBar(name: name),
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        // Ocupar todo el espacio de altura
        height: MediaQuery.of(context).size.height * 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                // Poner imagen recibida en la variable
                image: DecorationImage(
                  image: AssetImage(imageRef ?? 'images/durangocity.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
              child: Text(
                description ?? 'No Description',
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// clase para cambiar el nombre del appbar por el nombre recibido de la pagina

class CustomAppBar extends StatelessWidget {
  final String? name;

  const CustomAppBar({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        name ?? 'Turismo Durango',
        style: const TextStyle(fontSize: 35, color: Colors.white),
      ),
      centerTitle: true,
    );
  }
}





// Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             imageRef ??
//                 'placeholder_image_path', // Use a placeholder if imageRef is null
//             fit: BoxFit.cover,
//             height: 300,
//             width: 350,
//           ),
//           SizedBox(height: 20),
//           Text(
//             description ??
//                 'No description available', // Use a placeholder if description is null
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//             ),
//           ),
//         ],
//       ),