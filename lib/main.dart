import 'package:flutter/material.dart';
import 'package:flutter_app_equipo4_q4_24/main_theme.dart';
import 'package:flutter_app_equipo4_q4_24/screen/home_screen.dart';
import 'package:flutter_app_equipo4_q4_24/ui/pages/formulario_pagina.dart';
import 'package:flutter_app_equipo4_q4_24/ui/pages/segunda_pagina.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String titleApp = 'Encuesta';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleApp,
      theme: themeDataApp,
      home: const HomeScreen(title: titleApp,),
      debugShowCheckedModeBanner: false,
      routes: {
        'primera_pagina': (context) => FormularioPagina(),
        'segunda_pagina': (context) => SegundaPagina(),
      },
    );
  }
}