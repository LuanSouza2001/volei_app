import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/app_bloc.dart';
import 'package:volei_app/app/shared/utils/util.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final Util util = Modular.get();
  final bloc = AppBloc();

  Future<void> singOut() async {
    await bloc.singOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userUid() {
    return Text(bloc.currenteUser?.email ?? 'User email');
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
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userUid(),
            _singOutButton(),
          ],
        ),
      ),
    );
  }
}
