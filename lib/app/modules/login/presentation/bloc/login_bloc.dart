import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volei_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:volei_app/app/modules/login/domain/usecases/createAccount/create_account_usecase_imp.dart';
import 'package:volei_app/app/modules/login/domain/usecases/login/login_usecase_imp.dart';
import 'package:volei_app/app/modules/login/presentation/bloc/login_event.dart';
import 'package:volei_app/app/modules/login/presentation/bloc/login_state.dart';
import 'package:volei_app/app/network/login/login_service_imp.dart';
import 'package:volei_app/app/service/repositories/login_repository_imp.dart';
import 'package:volei_app/app/shared/utils/state.dart';

class LoginBloc extends Bloc<LoginEventBloc, LoginState> {
  LoginBloc(super.initialState);

  final loginUsecase = LoginUsecaseImp(LoginRepositoryImp(LoginServiceImp()));
  final createAccountUsecase =
      CreateAccountUsecaseImp(LoginRepositoryImp(LoginServiceImp()));

  Future login({required String email, required String password}) async {
    var request = await loginUsecase.login(email, password);

    if (request is Success) {
      emit(LoginSuccessState());
    } else if (request is Failure) {
      if (request.message == "wrong-password") {
        emit(LoginPasswordErrorState());
      } else if (request.message == "user-not-found") {
        emit(LoginEmailErrorState());
      }
      {}
    }
  }

  Future createAccount(
      {required String email, required String password}) async {
    try {
      await createAccountUsecase.createAccount(email, password);
    } catch (e) {
      e;
    }
  }

  Future isLogged() async {
    try {
      await loginUsecase.isLogged();
    } catch (e) {
      e;
    }
  }

  Future logout() async {
    try {
      await loginUsecase.logout();
    } catch (e) {
      e;
    }
  }

  @override
  void dispose() {}
}
