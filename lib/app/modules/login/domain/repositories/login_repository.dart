import 'package:volei_app/app/shared/utils/state.dart';

abstract class LoginRepository {
  Future<State> login(String email, String password);
  Future creatAccount(String email, String password);
  Future logout();
  Future isLogged();
}
