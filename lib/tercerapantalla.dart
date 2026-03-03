import 'package:flutter/material.dart';

class TerceraPantalla extends StatelessWidget {
  // Recibe los datos directamente por constructor
  final String nombre;
  final int contador;

  const TerceraPantalla({
    super.key,
    required this.nombre,
    required this.contador,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tercera Pantalla')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Nombre: $nombre'),
            const SizedBox(height: 10),
            Text('Contador: $contador'),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                // Regresa a la segunda pantalla
                Navigator.pop(context);
              },
              child: const Text('Regresar'),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                // Regresa directo a la primera pantalla (salta la segunda)
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
