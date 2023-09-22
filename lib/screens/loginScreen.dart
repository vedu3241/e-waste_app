import 'package:flutter/material.dart';

import '../components/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.tooglePages,
  });

  final Function()? tooglePages;

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    print("in login page init");
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // logo
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //Welcome mess
                    Text(
                      "Welcome back you been missed!",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //email
                    MytextField(
                      controller: emailTextController,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    // pass
                    const SizedBox(
                      height: 10,
                    ),
                    MytextField(
                      controller: passwordTextController,
                      hintText: "Pass",
                      obscureText: true,
                    ),
                    //sign
                    const SizedBox(
                      height: 25,
                    ),

                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 115, vertical: 20),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // go to regi page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a memeber?",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.tooglePages,
                          child: const Text(
                            "Register now",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
