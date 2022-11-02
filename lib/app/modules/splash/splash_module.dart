import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/modules/splash/splash_view.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const SplashView()),
      ];
}
