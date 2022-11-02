import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volei_app/app/modules/login/bloc/login_event.dart';
import 'package:volei_app/app/modules/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEventBloc, LoginState> {
  LoginBloc(super.initialState);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currenteUser => _firebaseAuth.currentUser;

  //Verifica se o user está logado ou não
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> singInWithEmailAndPasswordFirebase({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPasswordFirebase({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> isLogged() async {
    authStateChanges.listen((User? user) {
      if (user != null) {
        emit(LoginSuccessState());
      }
    });
  }

  Future<void> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState(true));
    try {
      await singInWithEmailAndPasswordFirebase(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //Email errado
        emit(LoginLoadingState(false));
        emit(LoginEmailErrorState());
      } else if (e.code == 'wrong-password') {
        emit(LoginLoadingState(false));
        //senha errada
        emit(LoginPasswordErrorState());
      } else if (e.code == 'too-many-requests') {
        //muitas requisições
        emit(LoginLoadingState(false));
        emit(LoginTooManyRequestErrorState());
      }
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState(true));
    try {
      await createUserWithEmailAndPasswordFirebase(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginLoadingState(false));
        //Email errado
        emit(LoginEmailErrorState());
      } else if (e.code == 'wrong-password') {
        emit(LoginLoadingState(false));
        //senha errada
        emit(LoginPasswordErrorState());
      }
    }
  }

  @override
  void dispose() {}
}
