import 'package:flutter/material.dart';
import 'package:porra_dam/features/bienvenida/pantalla_bienvenida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porra DAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 218, 255, 6),
        ),
      ),
      home: const PantallaBienvenida(),
    );
  }
}
