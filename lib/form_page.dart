import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final edadController = TextEditingController();
  final correoController = TextEditingController();
  final telefonoController = TextEditingController(); // AGREGADO: campo teléfono
  final ciudadController = TextEditingController();   // AGREGADO: campo ciudad

  @override
  void dispose() {
    nombreController.dispose();
    edadController.dispose();
    correoController.dispose();
    telefonoController.dispose(); // AGREGADO: liberar memoria del controller
    ciudadController.dispose();   // AGREGADO: liberar memoria del controller
    super.dispose();
  }

  bool _esNumeroPositivo(String texto) {
    final n = int.tryParse(texto);
    return n != null && n > 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              // Nombre
              //comentario:comentario
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nombre obligatorio';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // Edad
              TextFormField(
                controller: edadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Edad',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Edad obligatoria';
                  }
                  if (!_esNumeroPositivo(value.trim())) {
                    return 'Edad inválida';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // Correo
              TextFormField(
                controller: correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Correo obligatorio';
                  }
                  if (!value.contains('@')) {
                    return 'Correo inválido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // AGREGADO: campo teléfono con teclado numérico
              TextFormField(
                controller: telefonoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Teléfono obligatorio';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              // AGREGADO: campo ciudad
              TextFormField(
                controller: ciudadController,
                decoration: const InputDecoration(
                  labelText: 'Ciudad',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ciudad obligatoria';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {

                  // Ejecuta validaciones
                  final valido = _formKey.currentState!.validate();

                  if (!valido) return;

                  // Si todo está correcto, envía argumentos
                  Navigator.pushNamed(
                    context,
                    '/summary',
                    arguments: {
                      'nombre': nombreController.text.trim(),
                      'edad': edadController.text.trim(),
                      'correo': correoController.text.trim(),
                      'telefono': telefonoController.text.trim(), // AGREGADO
                      'ciudad': ciudadController.text.trim(),     // AGREGADO
                    },
                  );
                },
                child: const Text('Enviar'),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Regresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
