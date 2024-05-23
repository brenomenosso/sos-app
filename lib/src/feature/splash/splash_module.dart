import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos_app/src/feature/splash/cubit/splash_cubit.dart';
import 'package:sos_app/src/feature/splash/splash_page.dart';

class SplashModule extends FlutterGetItModule {

  @override
  List<Bind<Object>> get bindings => [
    //controller
    Bind.lazySingleton((i) => SplashCubit(authService: i()))
  ];

  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/': (context) => const SplashPage(),
  };
  
}