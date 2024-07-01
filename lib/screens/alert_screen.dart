import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            displayDialogAndorid(context);
          },
          child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Mostrar Alerta',
                style: TextStyle(fontSize: 30),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

void displayDialogAndorid(BuildContext context) {
  showDialog(
      barrierDismissible:
          false, //Opcion de que el usuario pueda cerrar la ventana o no
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Flutter ',
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.amber,
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'es un SDK de codigo abierto desarrollado por Google para crear apps Multiplataformas'),
              SizedBox(
                height: 20,
              ),
              FlutterLogo(
                size: 100,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cerrar',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))
          ],
        );
      });
}
