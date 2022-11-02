import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/modules/home/home_view.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => HomeView()),
      ];
}
