import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:porra_dam/features/jornada/jornada_screen.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _indiceSeleccionado = 0; // Empieza en la primera pestaña

  // Una pantalla por pestaña. Las tres últimas son provisionales.
  final List<Widget> _pantallas = [
    const JornadaScreen(),
    const Center(child: Text('RESULTADOS')),
    const Center(child: Text('CLASIFICACIÓN')),
    const Center(child: Text('PERFIL')),
  ];

  void _cambiar(int index) {
    setState(() {
      _indiceSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El contenido pasa por detrás de la barra de abajo, para que se vea el blur
      extendBody: true,
      body: _pantallas[_indiceSeleccionado],
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          // Desenfoque de lo que hay detrás de la barra
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: BottomNavigationBar(
            currentIndex: _indiceSeleccionado,
            onTap: _cambiar,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(
              0x26FFFFFF,
            ), // blanco casi transparente
            elevation: 0,
            selectedItemColor: const Color(0xFFFF8C32), // naranja
            unselectedItemColor: Colors.white70,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Jornada',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer),
                label: 'Resultados',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: 'Clasificación',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
