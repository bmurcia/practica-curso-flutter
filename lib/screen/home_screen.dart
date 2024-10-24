import 'package:flutter/material.dart';
import 'package:flutter_app_equipo4_q4_24/ui/pages/formulario_pagina.dart';


class HomeScreen extends StatelessWidget {
  final String title;
  
  const HomeScreen({
    required this.title,
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body:const Center(
        child: FormularioPagina(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.mail),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


  

