import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _goTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AquaClean'),
        backgroundColor: const Color(0xFF0077B6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _goTo(context, '/tienda'),
              child: const Text('Ir a Tienda'),
            ),
            ElevatedButton(
              onPressed: () => _goTo(context, '/carrito'),
              child: const Text('Ver Carrito'),
            ),
            ElevatedButton(
              onPressed: () => _goTo(context, '/contacto'),
              child: const Text('Contactar Técnico'),
            ),
            ElevatedButton(
              onPressed: () => _goTo(context, '/calculadora'),
              child: const Text('Calculadora de Tratamiento'),
            ),
          ],
        ),
      ),
    );
  }
}

