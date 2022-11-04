import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:volei_app/app/network/login/login_service.dart';
import 'package:volei_app/app/shared/utils/state.dart';

class LoginServiceImp implements LoginService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currenteUser => _firebaseAuth.currentUser;

  //Verifica se o user está logado ou não
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future createAccount(String email, String password) async {
    await createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<State> login(String email, String password) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(user.user);
    } on FirebaseAuthException catch (e) {
      return Failure(e.message);
    }
  }

  @override
  Future logout() async {
    await singOut();
  }

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }

  Future isLogged() async {
    var isNotLogged = false;
    authStateChanges.listen((User? user) {
      if (user != null) {
        isNotLogged = true;
      }
    });
    return isNotLogged;
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //Email errado
        print('email errado na service');
      } else if (e.code == 'wrong-password') {
        //senha errada
        print('senha errada na service');
      }
    }
  }
}
