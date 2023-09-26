import 'package:e_waste_app/auth/login_or_register.dart';
import 'package:e_waste_app/screens/base.dart';
import 'package:e_waste_app/screens/form_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Base(),
      // initialRoute: '/base',
      routes: {
        '/base': (context) => const Base(),
        '/loginOrReg': (context) => const LoginOrRegister(),
        // Define more routes here
      },
    );
  }
}
