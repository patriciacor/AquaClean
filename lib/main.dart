import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/tienda_screen.dart';
import 'screens/carrito_screen.dart';
import 'screens/contacto_tecnico_screen.dart';
import 'screens/calculadora_screen.dart';

void main() {
  runApp(const AquaCleanApp());
}

class AquaCleanApp extends StatelessWidget {
  const AquaCleanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaClean',
      theme: ThemeData(
        primaryColor: const Color(0xFF0077B6),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF8DBF17),
          primary: const Color(0xFF0077B6),
        ),
        fontFamily: 'Nunito',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/tienda': (context) => const TiendaScreen(),
        '/carrito': (context) => const CarritoScreen(),
        '/contacto': (context) => const ContactoTecnicoScreen(),
        '/calculadora': (context) => const CalculadoraScreen(),
      },
    );
  }
}
