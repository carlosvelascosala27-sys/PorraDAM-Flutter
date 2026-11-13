# Porra DAM ⚽ · Flutter

App para hacer una porra de los partidos de liga entre la clase.
Cada jornada, cada persona pronostica el resultado de los partidos; cuando se juegan,
la app compara los pronósticos con los resultados reales, reparte puntos y ordena una clasificación.
No hay dinero de por medio: solo puntos.

Microproyecto transversal del módulo **Sistemas de Gestión Empresarial** · 2º DAM · curso 2026-2027.

## Pantallas

| Pantalla | Qué muestra |
|---|---|
| Bienvenida | Alias del jugador y código del grupo para entrar en la porra |
| Jornada | Los partidos de la jornada con un selector de marcador para cada equipo |
| Resultados | Resultados oficiales frente a tu pronóstico, con los puntos de cada partido |
| Clasificación | Ranking de toda la clase, con tu posición resaltada |
| Perfil | Tus datos en la porra |

## Reglas del juego

- Resultado exacto: **8 puntos**.
- Si no es exacto: **+2** por acertar el 1X2 (quién gana o si es empate) y **+2** por cada equipo cuyos goles se acierten.

## Estructura del proyecto

Organizado por funcionalidades (*feature-first*):
lib/
├── main.dart
└── features/
├── bienvenida/
├── principal/ # Scaffold con la barra de navegación inferior
├── jornada/
├── resultados/
├── clasificacion/
└── perfil/
assets/
├── fonts/
└── images/ # fondo y escudos de los equipos

## Tecnologías
Flutter
Dart
Material Design
