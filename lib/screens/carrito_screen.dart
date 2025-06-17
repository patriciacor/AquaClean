import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/carrito_model.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: carrito.productos.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: carrito.productos.length,
                    itemBuilder: (context, index) {
                      final producto = carrito.productos[index];
                      return ListTile(
                        leading: Image.asset(producto.imagen,
                            width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(producto.nombre),
                        subtitle:
                            Text('\$${producto.precio.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            carrito.quitarProducto(producto);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Total: \$${carrito.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Aquí la lógica de checkout / pago
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Checkout'),
                        content: const Text('Funcionalidad de pago pendiente.'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cerrar')),
                        ],
                      ),
                    );
                  },
                  child: const Text('Pagar'),
                ),
                const SizedBox(height: 20),
              ],
            ),
    );
  }
}
