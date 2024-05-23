
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos_app/src/feature/home/widgets/map/cubit/map_cubit.dart';
import 'package:sos_app/src/feature/home/widgets/map/map_page.dart';

class MapModule extends FlutterGetItModulePageRouter {

  const MapModule({super.key});

  @override
  List<Bind<Object>> get bindings => [
    //controller
    Bind.singleton((i) => MapCubit(repository: i(), authService: i())..nearby())
  ];

  @override
  WidgetBuilder get view => (context) => const MapPage();

}