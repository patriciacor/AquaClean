import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/carrito_model.dart';
import '../models/producto.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({Key? key}) : super(key: key);

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _largoCtrl = TextEditingController();
  final TextEditingController _anchoCtrl = TextEditingController();
  final TextEditingController _profundidadCtrl = TextEditingController();
  final TextEditingController _phCtrl = TextEditingController();
  final TextEditingController _salCtrl = TextEditingController();

  double? _volumen;
  String? _diagnostico;
  List<Producto> _recomendaciones = [];

  final List<Producto> productosDisponibles = [
    Producto(
      id: "pH_up",
      nombre: "Incrementador de pH",
      descripcion: "Aumenta el pH de tu piscina a nivel ideal.",
      precio: 15.0,
      imagen: "assets/images/ph_up.png",
    ),
    Producto(
      id: "pH_down",
      nombre: "Reductor de pH",
      descripcion: "Reduce el pH para mantener el agua cristalina.",
      precio: 15.0,
      imagen: "assets/images/ph_down.png",
    ),
    Producto(
      id: "clarificante",
      nombre: "Clarificante",
      descripcion: "Elimina turbidez y mejora la claridad del agua.",
      precio: 10.0,
      imagen: "assets/images/clarificante.png",
    ),
    Producto(
      id: "algicida",
      nombre: "Algicida",
      descripcion: "Controla y elimina algas verdes.",
      precio: 20.0,
      imagen: "assets/images/algicida.png",
    ),
  ];

  void _calcular() {
    if (!_formKey.currentState!.validate()) return;

    final largo = double.parse(_largoCtrl.text);
    final ancho = double.parse(_anchoCtrl.text);
    final profundidad = double.parse(_profundidadCtrl.text);
    final ph = double.parse(_phCtrl.text);
    final sal = double.parse(_salCtrl.text);

    setState(() {
      _volumen = largo * ancho * profundidad;
      _diagnostico = null;
      _recomendaciones = [];

      if (ph < 7.0) {
        _diagnostico = "pH bajo. Se recomienda subir el pH.";
        _recomendaciones.add(productosDisponibles.firstWhere((p) => p.id == "pH_up"));
      } else if (ph > 7.6) {
        _diagnostico = "pH alto. Se recomienda bajar el pH.";
        _recomendaciones.add(productosDisponibles.firstWhere((p) => p.id == "pH_down"));
      } else {
        _diagnostico = "pH dentro del rango ideal.";
      }

      if (ph < 7.0) {
        _recomendaciones.add(productosDisponibles.firstWhere((p) => p.id == "algicida"));
      }
      if (ph > 7.6) {
        _recomendaciones.add(productosDisponibles.firstWhere((p) => p.id == "clarificante"));
      }
    });
  }

  @override
  void dispose() {
    _largoCtrl.dispose();
    _anchoCtrl.dispose();
    _profundidadCtrl.dispose();
    _phCtrl.dispose();
    _salCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora Avanzada")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Form(
              key: _formKey,
              child: Column(children: [
                _buildNumberField(_largoCtrl, "Largo (m)"),
                _buildNumberField(_anchoCtrl, "Ancho (m)"),
                _buildNumberField(_profundidadCtrl, "Profundidad (m)"),
                _buildNumberField(_phCtrl, "pH"),
                _buildNumberField(_salCtrl, "Sal (ppm)"),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _calcular,
                  child: const Text("Calcular"),
                ),
              ]),
            ),
            if (_volumen != null) ...[
              const SizedBox(height: 24),
              Text("Volumen: ${_volumen!.toStringAsFixed(2)} m³", style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text("Diagnóstico: $_diagnostico", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              if (_recomendaciones.isNotEmpty) ...[
                const Text("Recomendaciones de productos:", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _recomendaciones.length,
                  itemBuilder: (context, index) {
                    final prod = _recomendaciones[index];
                    final enCarrito = carrito.productos.any((p) => p.id == prod.id);
                    return Card(
                      child: ListTile(
                        leading: Image.asset(prod.imagen, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(prod.nombre),
                        subtitle: Text(prod.descripcion),
                        trailing: ElevatedButton(
                          onPressed: enCarrito
                              ? null
                              : () {
                                  carrito.agregarProducto(prod);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("${prod.nombre} agregado al carrito")),
                                  );
                                },
                          child: Text(enCarrito ? "Agregado" : "Agregar"),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ]),
        ),
      ),
    );
  }

  Widget _buildNumberField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Ingrese $label';
          if (double.tryParse(value) == null) return 'Debe ser un número válido';
          return null;
        },
      ),
    );
  }
}
