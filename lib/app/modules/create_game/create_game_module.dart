import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/modules/create_game/presentation/pages/create_game_page.dart';

class CreateGameModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const CreateGamePage()),
      ];
}
