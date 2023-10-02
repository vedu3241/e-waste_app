import 'package:e_waste_app/auth/login_or_register.dart';
import 'package:e_waste_app/screens/base.dart';
import 'package:e_waste_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: const SplashScreen(),
        nextScreen: const Base(),
      ),
      // initialRoute: '/base',
      routes: {
        '/base': (context) => const Base(),
        '/loginOrReg': (context) => const LoginOrRegister(),
        // Define more routes here
      },
    );
  }
}
