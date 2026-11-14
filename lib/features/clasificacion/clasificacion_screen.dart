import 'package:flutter/material.dart';

class ClasificacionScreen extends StatelessWidget {
  const ClasificacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Capa 1: foto del estadio de fondo
        Image.asset('assets/images/fondo_pantalla_hd.webp', fit: BoxFit.cover),

        // Capa 2: velo negro semitransparente
        Container(color: const Color(0x99000000)),

        // Capa 3: el contenido
        ListView(
          padding: const EdgeInsets.all(12),
          children: [
            _cabecera(),
            const SizedBox(height: 28),
            _tabla(),
            // Hueco para que la barra de abajo no tape la tabla
            const SizedBox(height: 70),
          ],
        ),
      ],
    );
  }

  // Título, subtítulo y el "desplegable" General (solo dibujo)
  Widget _cabecera() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Clasificación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Puntos de toda la temporada',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text(
            'General ▾',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Tarjeta blanca con toda la tabla dentro
  Widget _tabla() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // Títulos de las columnas
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 38,
                  child: Text(
                    '#',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Participante',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Text(
                  'Puntos',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFFEEEEEE), height: 1),

          // Los 3 primeros con medalla: oro, plata y bronce
          _fila(
            '1',
            'CV',
            'Carlos.V',
            '45',
            const Color(0xFFE57373),
            const Color(0xFFFFD54F),
            Colors.transparent,
          ),
          _fila(
            '2',
            'AB',
            'Anass.B',
            '41',
            const Color(0xFF64B5F6),
            const Color(0xFFCFD8DC),
            Colors.transparent,
          ),
          _fila(
            '3',
            'JT',
            'Javi_Turras',
            '40',
            const Color(0xFFBA68C8),
            const Color(0xFFFFAB91),
            Colors.transparent,
          ),
          // Tu fila: fondo verde clarito
          _fila(
            '4',
            'CH',
            'Cristian.H',
            '38',
            const Color(0xFF2E7D32),
            Colors.transparent,
            const Color(0xFFE8F5E9),
          ),
          _fila(
            '5',
            'GB',
            'Gonzalo.B',
            '35',
            const Color(0xFFFFB74D),
            Colors.transparent,
            Colors.transparent,
          ),
          _fila(
            '6',
            'HS',
            'Hila_sanchez',
            '33',
            const Color(0xFF9575CD),
            Colors.transparent,
            Colors.transparent,
          ),
          _fila(
            '7',
            'JM',
            'Javier.M',
            '30',
            const Color(0xFF4DD0E1),
            Colors.transparent,
            Colors.transparent,
          ),
          _fila(
            '8',
            'JF',
            'Javier.F',
            '27',
            const Color(0xFF81C784),
            Colors.transparent,
            Colors.transparent,
          ),
          _fila(
            '9',
            'FP',
            'Fran.P',
            '26',
            const Color(0xFFF06292),
            Colors.transparent,
            Colors.transparent,
          ),
          _fila(
            '10',
            'JM',
            'Josep.M',
            '19',
            const Color(0xFFFF8A65),
            Colors.transparent,
            Colors.transparent,
          ),
        ],
      ),
    );
  }

  // Una fila de la tabla: posición, avatar, nombre y puntos
  Widget _fila(
    String posicion,
    String iniciales,
    String nombre,
    String puntos,
    Color colorAvatar,
    Color colorMedalla,
    Color fondo,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: fondo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Número de posición (con circulito de color si es medalla)
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorMedalla,
              shape: BoxShape.circle,
            ),
            child: Text(
              posicion,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const SizedBox(width: 12),
          // Avatar: círculo de color con las iniciales
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorAvatar,
              shape: BoxShape.circle,
            ),
            child: Text(
              iniciales,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(nombre, style: const TextStyle(fontSize: 15))),
          Text(
            puntos,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
