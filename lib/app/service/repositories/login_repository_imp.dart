import 'package:volei_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:volei_app/app/network/login/login_service.dart';
import 'package:volei_app/app/shared/utils/state.dart';

class LoginRepositoryImp extends LoginRepository {
  final LoginService loginService;

  LoginRepositoryImp(this.loginService);

  @override
  Future<State> login(String email, String password) async {
    final request = await loginService.login(email, password);
    if (request is Success) {
      return Success(request);
    } else {
      if (request is Failure) {
        return Failure(request.message);
      } else {
        return Failure("Algo deu errado!");
      }
    }
  }

  @override
  Future creatAccount(String email, String password) async {
    await loginService.createAccount(email, password);
  }

  @override
  Future logout() async {
    await loginService.logout();
  }

  @override
  Future isLogged() async {
    await loginService.isLogged();
  }
}
