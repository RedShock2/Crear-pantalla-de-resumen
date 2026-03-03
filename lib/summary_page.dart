import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibimos los argumentos enviados desde FormPage
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Extraemos cada valor del mapa con su llave
    final String nombre   = args['nombre'];
    final String edad     = args['edad'];
    final String correo   = args['correo'];
    final String telefono = args['telefono'];
    final String ciudad   = args['ciudad'];

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Título de la sección
            const Text(
              'Datos ingresados',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Tarjeta con todos los datos del formulario
            Card(
              elevation: 4,
              child: Column(
                children: [
                  _fila(Icons.person,    'Nombre',    nombre),
                  const Divider(height: 1),
                  _fila(Icons.cake,      'Edad',      edad),
                  const Divider(height: 1),
                  _fila(Icons.email,     'Correo',    correo),
                  const Divider(height: 1),
                  _fila(Icons.phone,     'Teléfono',  telefono),
                  const Divider(height: 1),
                  _fila(Icons.location_city, 'Ciudad', ciudad),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Botón para regresar al formulario
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar que construye cada fila de datos
  Widget _fila(IconData icono, String etiqueta, String valor) {
    return ListTile(
      leading: Icon(icono),
      title: Text(etiqueta, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(valor, style: const TextStyle(fontSize: 16, color: Colors.black87)),
    );
  }
}
