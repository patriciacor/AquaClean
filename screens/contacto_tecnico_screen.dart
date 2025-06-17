import 'package:flutter/material.dart';

class ContactoTecnicoScreen extends StatelessWidget {
  const ContactoTecnicoScreen({Key? key}) : super(key: key);

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: agregar formulario con calendario y mapa de ubicación
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactar Técnico'),
        backgroundColor: const Color(0xFF0077B6),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _goBack(context),
          child: const Text('Volver'),
        ),
      ),
    );
  }
}

