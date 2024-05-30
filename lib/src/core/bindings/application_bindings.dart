
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sos_app/src/core/interceptor/b4a_interceptor.dart';
import 'package:sos_app/src/repositories/user/user_repository.dart';
import 'package:sos_app/src/repositories/user/user_repository_impl.dart';
import 'package:sos_app/src/services/auth/auth_service.dart';
import 'package:sos_app/src/services/locator/locator_service.dart';

class ApplicationBinding extends ApplicationBindings {

  @override
  List<Bind<Object>> bindings() => [
    Bind.lazySingleton<Dio>((i) => Dio()..interceptors.add(B4aInterceptor())),
    Bind.lazySingleton<AudioPlayer>((i) => AudioPlayer()..setReleaseMode(ReleaseMode.loop)),
    Bind.lazySingleton<FlutterSecureStorage>((i) => const FlutterSecureStorage()),
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
    Bind.lazySingleton<LocatorService>((i) => LocatorService()..init()),
    Bind.lazySingleton<AuthService>((i) => AuthService(storage: i(), repository: i())),
  ];
  
}