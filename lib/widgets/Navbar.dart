import 'package:flutter/material.dart';
import 'package:proyecto/router/app_router.dart';
// import 'package:proyecto/router/app_router.dart';

// Widget que se usar para llamar el Drawer en todo el documento  (Menu despegable)

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavWidget();
}

class _NavWidget extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[50],
      child: Column(
        children: [
          // Widget para mostrar foto e informacion del usuario
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Uriel Contreras',
              style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: .7),
            ),
            accountEmail: const Text('root@gmail.com',
                style:
                    TextStyle(fontWeight: FontWeight.w800, letterSpacing: .7)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/uriel-foto.jpg',
                ),
              ),
            ),
            // dar decoracion al fondo donde se encuentra la informacion del usuario
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/durangobackimage.jpeg',
                    ),
                    fit: BoxFit.cover)),
          ),
          // Expandir el widget para agregar las rutas ingresadas en app_router
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  AppRouter.menuOptions[index].icon,
                  color: Colors.black,
                ),
                title: Text(AppRouter.menuOptions[index].name),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRouter.menuOptions[index].route,
                  );
                },
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: AppRouter.menuOptions.length,
            ),
          ),
        ],
      ),
    );
  }
}
