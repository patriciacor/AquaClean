import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactoTecnicoScreen extends StatefulWidget {
  const ContactoTecnicoScreen({Key? key}) : super(key: key);

  @override
  State<ContactoTecnicoScreen> createState() => _ContactoTecnicoScreenState();
}

class _ContactoTecnicoScreenState extends State<ContactoTecnicoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _telefonoCtrl = TextEditingController();
  final TextEditingController _ubicacionCtrl = TextEditingController();

  Future<void> _enviarPorWhatsApp() async {
    if (_formKey.currentState!.validate()) {
      final nombre = _nombreCtrl.text;
      final telefono = _telefonoCtrl.text;
      final ubicacion = _ubicacionCtrl.text;

      final mensaje = Uri.encodeComponent(
        "Hola, soy $nombre. Mi número es $telefono. Quisiera contactar un técnico en la siguiente ubicación: $ubicacion.",
      );

      final url = "https://wa.me/598XXXXXXXX?text=$mensaje"; // Reemplaza con número real

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No se pudo abrir WhatsApp")),
        );
      }
    }
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _telefonoCtrl.dispose();
    _ubicacionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contactar Técnico"),
        backgroundColor: const Color(0xFF0077B6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_nombreCtrl, "Nombre completo"),
              const SizedBox(height: 12),
              _buildTextField(_telefonoCtrl, "Teléfono", tipo: TextInputType.phone),
              const SizedBox(height: 12),
              _buildTextField(_ubicacionCtrl, "Ubicación (ciudad, barrio, etc)"),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _enviarPorWhatsApp,
                icon: const Icon(Icons.whatsapp),
                label: const Text("Enviar por WhatsApp"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType tipo = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: tipo,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Campo obligatorio' : null,
    );
  }
}
