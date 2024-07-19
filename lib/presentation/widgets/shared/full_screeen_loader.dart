import 'package:flutter/material.dart';

class FullScreeenLoader extends StatelessWidget {
  const FullScreeenLoader({super.key});

  Stream<String> getLoadingMessage() {
    final loadingMessages = <String>[
      "Preparando la magia del cine para ti...",
      "Cargando tu próxima aventura cinematográfica...",
      "Popcorn listo, estamos buscando las mejores películas...",
      "Eligiendo las joyas del séptimo arte, un momento por favor...",
      "Encontrando las películas más épicas para ti...",
      "La función está a punto de comenzar, ¡no te vayas!",
      "Los mejores actores están en camino...",
      "Ajustando la pantalla grande, ¡solo un segundo más!",
      "La alfombra roja está casi lista...",
      "Haciendo clics mágicos para traerte las mejores historias...",
      "Buscando las películas más emocionantes para tu maratón...",
      "¡Las palomitas están casi listas, al igual que tus películas!",
      "En breve tendrás una lista llena de emociones...",
      "Preparando el escenario para una experiencia cinematográfica única...",
      "Un poco de paciencia, estamos eligiendo solo lo mejor para ti..."
    ];

    return Stream.periodic(
      const Duration(milliseconds: 1500),
      (step) => loadingMessages[step],
    ).take(loadingMessages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Espere por favor"),
        const SizedBox(height: 10),
        const CircularProgressIndicator(strokeWidth: 2),
        const SizedBox(height: 10),
        StreamBuilder(stream: getLoadingMessage(), builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Cargando...');

          return Text(snapshot.data!);
        },)
      ],
    );
  }
}
