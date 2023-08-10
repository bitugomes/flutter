import 'package:flutter/material.dart';
import 'package:app_lista_tarefa/pagina_lista.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pagina_lista(),
    );
  }
}
