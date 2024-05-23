import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:sos_app/src/feature/home/widgets/user_config/cubit/user_cubit_cubit.dart';
import 'package:sos_app/src/feature/home/widgets/user_config/user_config_page.dart';
import 'package:sos_app/src/services/auth_service.dart';

class UserModule extends FlutterGetItModulePageRouter {

  const UserModule({super.key});

  @override
  List<Bind<Object>> get bindings => [
    //controller
    Bind.lazySingleton((i) => UserCubitCubit(userRepository: i(), authService: i())),
  ];

  @override
  WidgetBuilder get view => (context) => UserConfig(
    user: Injector.get<AuthService>().user!
  ); 
  
}