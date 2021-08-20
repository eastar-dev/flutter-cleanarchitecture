import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/source/remote/authentication_state.dart';
import 'email_login_form.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AuthenticationStateNotifier>(
      create: (context) => AuthenticationStateNotifier(),
      builder: (context, _) => Login(),
    ),
  );
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    developer.log("build");
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        buttonTheme: Theme.of(context)
            .buttonTheme
            .copyWith(highlightColor: Colors.deepPurple),
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void Function(String email, String password) loginAccount =
      (email, password) => {
            developer.log("loginAccount $email $password"),
          };

  void Function() cancel = () => {
        developer.log("cancel"),
      };

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AuthenticationStateNotifier>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Login ${data.loginState}")),
      body: Center(
        child: Consumer<AuthenticationStateNotifier>(
          builder: (context, authenticationStateNotifier, child) =>
              EmailLoginForm(
            cancel: cancel,
            loginAccount: loginAccount,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
            heroTag: null,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => {},
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            heroTag: null,
          )
        ],
      ),
    );
  }
}
