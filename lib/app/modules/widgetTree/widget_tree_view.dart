import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/app_bloc.dart';

class WidgetTreeView extends StatefulWidget {
  const WidgetTreeView({super.key});

  @override
  State<WidgetTreeView> createState() => _WidgetTreeViewState();
}

class _WidgetTreeViewState extends State<WidgetTreeView> {
  final bloc = AppBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Modular.to.pushNamed('/home');
        } else {
          Modular.to.pushNamed('/login');
        }
        return Container();
      },
    );
  }
}
