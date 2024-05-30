import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sos_app/src/services/auth/auth_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthService authService;

  SplashCubit({required this.authService}) : super(SplashInitial());

  Future<void >login() async {
    if (await authService.login()) {
      emit(SplashLoggedState());
    } else {
      emit(SplashErrorState('Erro ao fazer login'));
    }
  }
}
