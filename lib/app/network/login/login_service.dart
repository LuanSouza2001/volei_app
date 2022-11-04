import 'dart:async';

import 'package:volei_app/app/shared/utils/state.dart';

abstract class LoginService {
  Future<State> login(String email, String password);
  Future logout();
  Future createAccount(String email, String password);
  Future isLogged();
}
