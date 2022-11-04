import 'package:volei_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:volei_app/app/modules/login/domain/usecases/createAccount/create_account_usecase.dart';
import 'package:volei_app/app/modules/login/domain/usecases/login/login_usecase.dart';

class CreateAccountUsecaseImp implements ICreateAccountUsecase {
  final LoginRepository loginRepository;

  CreateAccountUsecaseImp(this.loginRepository);

  @override
  Future createAccount(String email, String password) {
    return loginRepository.creatAccount(email, password);
  }
}
