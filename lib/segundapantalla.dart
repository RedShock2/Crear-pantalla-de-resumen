import 'package:flutter/material.dart';
import 'tercerapantalla.dart';

class SegundaPantalla extends StatelessWidget {
  const SegundaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibimos los argumentos enviados desde la primera pantalla
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String nombre = args['nombre'];
    final int contador = args['contador'];

    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Pantalla')),
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
                // Navegamos a la tercera pantalla pasando los datos por constructor
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TerceraPantalla(nombre: nombre, contador: contador),
                  ),
                );
              },
              child: const Text('Ir a tercera pantalla'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Regresamos a la pantalla anterior
                Navigator.pop(context);
              },
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
