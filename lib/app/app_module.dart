import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/modules/create_game/create_game_module.dart';
import 'package:volei_app/app/modules/game_list/game_list_module.dart';
import 'package:volei_app/app/modules/home/home_module.dart';
import 'package:volei_app/app/modules/login/login_module.dart';
import 'package:volei_app/app/modules/splash/splash_module.dart';
import 'package:volei_app/app/shared/utils/util.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Util()),
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/create_game', module: CreateGameModule()),
    ModuleRoute('/game_list', module: GameListModule()),
  ];
}
