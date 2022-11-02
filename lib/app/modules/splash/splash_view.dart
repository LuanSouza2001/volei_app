import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/shared/utils/util.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final Util util = Modular.get();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
        (value) => Navigator.of(context).pushReplacementNamed('/widget_tree'));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.yellow,
        child: Center(
          child: Text(
            'Bem vindo!',
            style: TextStyle(
              fontSize: util.getadaptiveText(context, fontsize: 48),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
