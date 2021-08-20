import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'email_login_form.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(
        cancel: () => {
          developer.log("cancel"),
        },
        loginAccount: (email, password) => {
          developer.log("loginAccount $email $password"),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    required this.loginAccount,
    required this.cancel,
  });

  final void Function(String email, String password) loginAccount;
  final void Function() cancel;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: EmailLoginForm(
          cancel: widget.cancel,
          loginAccount: widget.loginAccount,
        ),
      ),
    );
  }
}
