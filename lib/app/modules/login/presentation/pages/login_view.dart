import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/modules/login/presentation/bloc/login_bloc.dart';
import 'package:volei_app/app/modules/login/presentation/bloc/login_state.dart';
import 'package:volei_app/app/shared/utils/util.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final Util util = Modular.get();
  final bloc = LoginBloc(LoginInitState());
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> singInWithEmailAndPassword() async {
    await bloc.login(
        email: _controllerEmail.text, password: _controllerPassword.text);
  }

  Future<void> createAccountInWithEmailAndPassword() async {
    await bloc.createAccount(
        email: _controllerEmail.text, password: _controllerPassword.text);
  }

  Widget _title() {
    return const Text('Firabse Auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        //isLogin :
        singInWithEmailAndPassword();
        //createAccountInWithEmailAndPassword();
      },
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc.isLogged();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _title(),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _entryField('email', _controllerEmail),
            _entryField('password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
            BlocBuilder<LoginBloc, LoginState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is LoginSuccessState) {
                  Modular.to.pushNamed("/home");
                }

                if (state is LoginInitState) {}

                if (state is LoginLoadingState) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  }
                }

                if (state is LoginEmailErrorState) {
                  return const Text('Email invalido');
                }

                if (state is LoginPasswordErrorState) {
                  return const Text('Senha incorreta');
                }

                if (state is LoginTooManyRequestErrorState) {
                  return const Text('Muitas tentativas de login');
                }

                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
