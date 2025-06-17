import 'package:flutter/material.dart';
import 'producto.dart';

class CarritoModel extends ChangeNotifier {
  final List<Producto> _productos = [];

  List<Producto> get productos => List.unmodifiable(_productos);

  double get total => _productos.fold(0, (sum, p) => sum + p.precio);

  void agregarProducto(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }

  void quitarProducto(Producto producto) {
    _productos.remove(producto);
    notifyListeners();
  }

  void vaciar() {
    _productos.clear();
    notifyListeners();
  }
}
