import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void _login(BuildContext context) {
    // TODO: agregar lógica de autenticación (Firebase, Google, FB)
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0077B6),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _login(context),
          child: const Text('Ingresar'),
        ),
      ),
    );
  }
}
