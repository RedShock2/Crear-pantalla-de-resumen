import 'package:flutter/material.dart';
import 'home_page.dart';
import 'form_page.dart';
import 'summary_page.dart'; // importamos la pantalla resumen que creamos

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // initialRoute: pantalla que se muestra al abrir la app
      initialRoute: '/',

      // routes: mapa de rutas nombradas para navegar con pushNamed
      // así no necesitamos importar cada pantalla donde queramos navegar
      routes: {
        '/': (context) => const HomePage(),
        '/form': (context) => const FormPage(),
        '/summary': (context) => const SummaryPage(), // ruta de la pantalla resumen
      },
    );
  }
}
