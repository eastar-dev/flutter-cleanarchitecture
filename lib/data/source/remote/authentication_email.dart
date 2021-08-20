import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';
import '../../../domain/entity/authentication_state.dart';
import '../../../domain/entity/authentication_type.dart';

class AuthenticationEmailNotifier extends ChangeNotifier {
  AuthenticationState _loginState = AuthenticationState.logout;

  AuthenticationState get loginState => _loginState;

  AuthenticationType _loginType = AuthenticationType.email;

  AuthenticationType get loginType => _loginType;

  String? _email;

  String? get email => _email;

  AuthenticationEmailNotifier() {
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

  void startLoginFlow() {
    _loginType = AuthenticationType.email;
    notifyListeners();
  }

  Future<List<String>> verifyEmail(
    String email,
  ) async {
    try {
      var result =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      notifyListeners();
      return result;
    } on FirebaseAuthException catch (e) {
      developer.log(e.stackTrace.toString());
      throw e;
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return result;
    } on FirebaseAuthException catch (e) {
      developer.log(e.stackTrace.toString());
      throw e;
    }
  }

  Future<UserCredential> registerAccount(
    String email,
    String displayName,
    String password,
  ) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
      return credential;
    } on FirebaseAuthException catch (e) {
      developer.log(e.stackTrace.toString());
      throw e;
    }
  }

  void cancelRegistration() {
    _loginState = AuthenticationState.logout;
    notifyListeners();
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void notifyListeners() {
    developer.log(_loginState.toString());
    super.notifyListeners();
  }
}
