abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginEmailErrorState extends LoginState {}

class LoginPasswordErrorState extends LoginState {}

class LoginTooManyRequestErrorState extends LoginState {}

class LoginLoadingState extends LoginState {
  bool isLoading;
  LoginLoadingState(this.isLoading);
}

class LogoutState extends LoginState {}
