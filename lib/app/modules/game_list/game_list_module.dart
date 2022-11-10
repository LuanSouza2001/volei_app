import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/modules/game_list/presentation/pages/game_list_page.dart';

class GameListModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const GameListPage()),
      ];
}
