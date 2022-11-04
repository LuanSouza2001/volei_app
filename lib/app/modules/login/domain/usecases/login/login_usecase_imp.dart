import 'package:volei_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:volei_app/app/modules/login/domain/usecases/login/login_usecase.dart';
import 'package:volei_app/app/shared/utils/state.dart';

class LoginUsecaseImp implements ILoginUsecase {
  final LoginRepository loginRepository;

  LoginUsecaseImp(this.loginRepository);

  @override
  Future<State> login(String email, String password) async {
    return await loginRepository.login(email, password);
  }

  @override
  Future isLogged() async {
    await loginRepository.isLogged();
  }

  @override
  Future logout() async {
    await loginRepository.logout();
  }
}
