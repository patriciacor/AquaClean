import 'package:flutter/material.dart';

class TiendaScreen extends StatelessWidget {
  const TiendaScreen({Key? key}) : super(key: key);

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void _goToCarrito(BuildContext context) {
    Navigator.pushNamed(context, '/carrito');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: agregar listado de productos y lógica de agregar al carrito
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda'),
        backgroundColor: const Color(0xFF0077B6),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => _goToCarrito(context),
          ),
        ],
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

