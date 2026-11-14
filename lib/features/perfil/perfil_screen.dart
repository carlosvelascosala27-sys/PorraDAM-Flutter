import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Fondo naranja amanecer: degradado de arriba a abajo
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF6B24A),
            Color(0xFFE8792E),
            Color(0xFF9A3A1A),
            Color(0xFF3A1A10),
          ],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const SizedBox(height: 16),
          _cabecera(),
          const SizedBox(height: 20),
          _estadisticas(),
          const SizedBox(height: 12),
          _historial(),
          const SizedBox(height: 12),
          _salirDelGrupo(),
          // Hueco para que la barra de abajo no tape el contenido
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  // Avatar grande con iniciales, alias y grupo
  Widget _cabecera() {
    return Column(
      children: [
        Container(
          width: 84,
          height: 84,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFE24B4A),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: const Text(
            'CV',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Carlos.V',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Grupo: 1A - DAM - 2026',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  // Los 3 cuadritos repartidos a partes iguales
  Widget _estadisticas() {
    return Row(
      children: [
        Expanded(child: _cuadro('45', 'puntos', const Color(0xFF3B6D11))),
        const SizedBox(width: 8),
        Expanded(child: _cuadro('1º', 'puesto', const Color(0xFF854F0B))),
        const SizedBox(width: 8),
        Expanded(child: _cuadro('3', 'exactos', const Color(0xFF185FA5))),
      ],
    );
  }

  // Un cuadrito blanco: número grande de color y etiqueta gris debajo
  Widget _cuadro(String valor, String etiqueta, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            valor,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            etiqueta,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // Tarjeta con los puntos de cada jornada
  Widget _historial() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 4),
            child: Text(
              'Historial',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          _filaHistorial('Jornada 1', '+24 pts'),
          _filaHistorial('Jornada 2', '+21 pts'),
        ],
      ),
    );
  }

  // Una fila del historial con su línea de separación encima
  Widget _filaHistorial(String jornada, String puntos) {
    return Column(
      children: [
        const Divider(color: Color(0xFFE0E0E0), height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(jornada, style: const TextStyle(fontSize: 15)),
              ),
              Text(
                puntos,
                style: const TextStyle(
                  color: Color(0xFF3B6D11),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Tarjeta roja de salir (solo dibujo, no hace nada)
  Widget _salirDelGrupo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Row(
        children: [
          Icon(Icons.logout, color: Color(0xFFA32D2D)),
          SizedBox(width: 10),
          Text(
            'Salir del grupo',
            style: TextStyle(
              color: Color(0xFFA32D2D),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
