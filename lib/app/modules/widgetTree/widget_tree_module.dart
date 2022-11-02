import 'package:flutter_modular/flutter_modular.dart';
import 'package:volei_app/app/modules/widgetTree/widget_tree_view.dart';

class WidgetTreeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const WidgetTreeView()),
      ];
}
