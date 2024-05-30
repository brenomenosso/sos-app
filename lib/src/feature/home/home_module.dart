
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos_app/src/feature/home/cubit/sos_cubit.dart';
import 'package:sos_app/src/feature/home/home_page.dart';
import 'package:sos_app/src/repositories/location/location_repository.dart';
import 'package:sos_app/src/repositories/location/location_repository_impl.dart';

class HomeModule extends FlutterGetItModule {

  // @override
  // List<Bind<Object>> get bindings => [
  //   //controller
  //   Bind.lazySingleton((i) => SosCubit()),
  //   Bind.lazySingleton<LocationRepository>((i) => LocationRepositoryImpl(dio: i()))
  // ];

  @override
  List<Bind<Object>> get bindings => [
    //controller
    Bind.lazySingleton<LocationRepository>((i) => LocationRepositoryImpl(dio: i())),
    Bind.lazySingleton((i) => SosCubit(repository: i(), authService: i(), locationsService: i())),
  ];

  @override
  String get moduleRouteName => '/home';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/': (context) => HomePage(controller: Injector.get())
  };
  
}
  