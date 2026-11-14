import 'package:flutter/material.dart';

class ResultadosScreen extends StatelessWidget {
  const ResultadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Capa 1: foto del estadio de fondo
        Image.asset('assets/images/fondo_pantalla_hd.webp', fit: BoxFit.cover),

        // Capa 2: velo negro semitransparente
        Container(color: const Color(0x99000000)),

        // Capa 3: el contenido (todo se puede desplazar)
        ListView(
          padding: const EdgeInsets.all(12),
          children: [
            _cabecera(),
            const SizedBox(height: 40),
            _totalJornada(),
            // Hueco para que la barra de abajo no tape el total
            const SizedBox(height: 12),
            _tarjetaResultado(
              'Atlético Madrid',
              'escudo_atletico_madrid.png',
              '2',
              'Real Madrid',
              'escudo_real_madrid.png',
              '1',
              'Tu porra: 2 - 1',
              '+8',
            ),
            _tarjetaResultado(
              'FC Barcelona',
              'escudo_barcelona.png',
              '3',
              'Villarreal CF',
              'escudo_villarreal.png',
              '0',
              'Tu porra: 2 - 0',
              '+4',
            ),
            _tarjetaResultado(
              'Sevilla FC',
              'escudo_sevilla.png',
              '1',
              'Real Sociedad',
              'escudo_real_sociedad.png',
              '1',
              'Tu porra: 1 - 0',
              '+2',
            ),
            _tarjetaResultado(
              'Real Betis',
              'escudo_betis.png',
              '2',
              'Valencia CF',
              'escudo_valencia.png',
              '1',
              'Tu porra: 1 - 1',
              '+2',
            ),
            _tarjetaResultado(
              'Athletic Club',
              'escudo_athletic.png',
              '1',
              'Celta de Vigo',
              'escudo_celta.png',
              '0',
              'Tu porra: 1 - 0',
              '+8',
            ),
          ],
        ),
      ],
    );
  }

  // Título, subtítulo y el "desplegable" Jornada 1 (solo dibujo)
  Widget _cabecera() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resultados',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Resultados oficiales y puntos obtenidos',
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
            'Jornada 1 ▾',
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

  // Tarjeta blanca de un partido ya jugado
  Widget _tarjetaResultado(
    String local,
    String escudoLocal,
    String golesLocal,
    String visitante,
    String escudoVisitante,
    String golesVisitante,
    String porra,
    String puntos,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Izquierda: los dos equipos con sus goles y la etiqueta de tu porra
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _filaEquipo(local, escudoLocal, golesLocal),
                const SizedBox(height: 8),
                _filaEquipo(visitante, escudoVisitante, golesVisitante),
                const SizedBox(height: 8),
                // Etiqueta verde "Tu porra: 2 - 1"
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0x1F2E7D32),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    porra,
                    style: const TextStyle(
                      color: Color(0xFF2E7D32),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Derecha: cuadrado redondeado con los puntos
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0x1F2E7D32),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              puntos,
              style: const TextStyle(
                color: Color(0xFF2E7D32),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Una fila: escudo, nombre y goles
  Widget _filaEquipo(String nombre, String escudo, String goles) {
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
        Text(
          goles,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Tarjeta final con el total de la jornada
  Widget _totalJornada() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        children: [
          Icon(Icons.star, color: Color(0xFFF9A825)),
          SizedBox(width: 8),
          Expanded(
            child: Text('Total jornada', style: TextStyle(fontSize: 15)),
          ),
          Text(
            '+24 pts',
            style: TextStyle(
              color: Color(0xFF2E7D32),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
