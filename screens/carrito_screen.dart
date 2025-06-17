import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({Key? key}) : super(key: key);

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: agregar lista de productos en carrito y total a pagar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        backgroundColor: const Color(0xFF0077B6),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _goBack(context),
          child: const Text('Volver a Tienda'),
        ),
      ),
    );
  }
}

