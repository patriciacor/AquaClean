
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AquaClean')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/calculadora'),
              child: const Text('Ir a Calculadora'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/carrito'),
              child: const Text('Ver Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}

