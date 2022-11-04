import 'package:volei_app/app/shared/utils/state.dart';

abstract class ILoginUsecase {
  Future<State> login(String email, String password);

  Future isLogged();

  Future logout();
}
