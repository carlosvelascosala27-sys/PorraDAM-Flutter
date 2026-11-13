import 'package:flutter/material.dart';

class JornadaScreen extends StatelessWidget {
  const JornadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Capa 1: foto del estadio de fondo
        Image.asset('assets/images/fondo_pantalla_hd.webp', fit: BoxFit.cover),

        // Capa 2: velo negro semitransparente para que se lea bien
        Container(color: const Color(0x99000000)),

        // Capa 3: el contenido
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Títulos en blanco
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jornada 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tu porra para esta jornada',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Se cierra el: Sáb 12 oct · 16:00',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Los 5 partidos (la lista ocupa el hueco que sobra)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  _tarjetaPartido(
                    'Atlético Madrid',
                    'escudo_atletico_madrid.png',
                    '2',
                    'Real Madrid',
                    'escudo_real_madrid.png',
                    '1',
                  ),
                  _tarjetaPartido(
                    'FC Barcelona',
                    'escudo_barcelona.png',
                    '3',
                    'Villarreal CF',
                    'escudo_villarreal.png',
                    '0',
                  ),
                  _tarjetaPartido(
                    'Sevilla FC',
                    'escudo_sevilla.png',
                    '1',
                    'Real Sociedad',
                    'escudo_real_sociedad.png',
                    '1',
                  ),
                  _tarjetaPartido(
                    'Real Betis',
                    'escudo_betis.png',
                    '2',
                    'Valencia CF',
                    'escudo_valencia.png',
                    '1',
                  ),
                  _tarjetaPartido(
                    'Athletic Club',
                    'escudo_athletic.png',
                    '1',
                    'Celta de Vigo',
                    'escudo_celta.png',
                    '0',
                  ),
                ],
              ),
            ),

            // Botón blanco con letras negras (no hace nada)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(52),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Guardar pronósticos',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ],
    );
  }

  // Dibujo de una tarjeta blanca de partido. Se usa 5 veces cambiando los textos
  Widget _tarjetaPartido(
    String local,
    String escudoLocal,
    String golesLocal,
    String visitante,
    String escudoVisitante,
    String golesVisitante,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _filaEquipo(local, escudoLocal, golesLocal, Icons.keyboard_arrow_up),
          const SizedBox(height: 10),
          _filaEquipo(
            visitante,
            escudoVisitante,
            golesVisitante,
            Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }

  // Dibujo de una fila: escudo, nombre, recuadro "2 ▾" y flechita
  Widget _filaEquipo(
    String nombre,
    String escudo,
    String goles,
    IconData flecha,
  ) {
    return Row(
      children: [
        Image.asset('assets/images/$escudo', width: 30, height: 30),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            nombre,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        // Recuadro "2 ▾" (solo dibujo)
        Container(
          padding: const EdgeInsets.only(left: 12, right: 4, top: 4, bottom: 4),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFDDDDDD)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                goles,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.grey),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Icon(flecha, color: Colors.grey),
      ],
    );
  }
}
