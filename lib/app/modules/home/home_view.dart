import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/modules/login/bloc/login_bloc.dart';
import 'package:volei_app/app/modules/login/bloc/login_state.dart';
import 'package:volei_app/app/shared/utils/util.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = LoginBloc(LoginInitState());
  final Util util = Modular.get();

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Future<void> singOut() async {
    await bloc.singOut();
    Modular.to.pushNamed('/login');
  }

  Widget _singOutButton() {
    return ElevatedButton(
      onPressed: singOut,
      child: const Text('Sing Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _title(),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.amber,
        child: _singOutButton(),
      ),
    );
  }
}
