import 'package:flutter/material.dart';

import '../screens/loginScreen.dart';
import '../screens/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void tooglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        tooglePages: tooglePages,
      );
    } else {
      return RegisterPage(
        tooglePages: tooglePages,
      );
    }
  }
}
