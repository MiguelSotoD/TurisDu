import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Variable Global para color primario

  // ignore: non_constant_identifier_names
  static final ThemeData TemaApp = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    // textTheme: GoogleFonts.bebasNeueTextTheme(),
    // appBar Theme
    appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 134, 8, 8)),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.black,
        )),
    inputDecorationTheme: const InputDecorationTheme(
        // Theme para la caja de texto sin estar activo

        ),
  );
}
