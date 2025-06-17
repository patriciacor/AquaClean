import 'package:flutter/material.dart';

class CalculadoraScreen extends StatelessWidget {
  const CalculadoraScreen({Key? key}) : super(key: key);

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: agregar formulario para largo, ancho, profundidad, pH, sal y cálculos automáticos
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Tratamiento'),
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

