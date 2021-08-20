import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';
import '../../../domain/entity/authentication_state.dart';
import '../../../domain/entity/authentication_type.dart';

class AuthenticationStateNotifier extends ChangeNotifier {
  AuthenticationState _loginState = AuthenticationState.logout;

  AuthenticationState get loginState => _loginState;

  AuthenticationType _loginType = AuthenticationType.email;

  AuthenticationType get loginType => _loginType;

  AuthenticationStateNotifier() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = AuthenticationState.login;
      } else {
        _loginState = AuthenticationState.logout;
      }
      notifyListeners();
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  @override
  void notifyListeners() {
    developer.log(_loginState.toString());
    super.notifyListeners();
  }
}
