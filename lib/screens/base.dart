import 'package:flutter/material.dart';
import 'package:e_waste_app/auth/login_or_register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_waste_app/screens/home_screen.dart';

var finalUserID = null;

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _Base();
}

class _Base extends State<Base> {
  //On restart app check the prefToken and on basis of that show required screen

  var activeScreen = 'login-regi';

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      if (finalUserID == null) {
        setState(() {
          activeScreen = 'login-regi';
        });
      } else {
        setState(() {
          activeScreen = 'home-screen';
        });
      }
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedId = sharedPreferences.getString('userId');
    setState(() {
      finalUserID = obtainedId;
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = const LoginOrRegister();
    if (activeScreen == 'home-screen') {
      screenWidget = HomeScreen(
        userId: finalUserID,
      );
    }
    if (activeScreen == 'login-regi') {
      screenWidget = const LoginOrRegister();
    }
    return screenWidget;
  }
}
