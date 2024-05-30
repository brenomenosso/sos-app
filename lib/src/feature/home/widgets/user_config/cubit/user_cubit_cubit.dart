import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sos_app/model/user_model.dart';
import 'package:sos_app/src/repositories/user/user_repository.dart';
import 'package:sos_app/src/services/auth/auth_service.dart';

part 'user_cubit_state.dart';

class UserCubitCubit extends Cubit<UserCubitState> {

  final UserRepository _userRepository;
  final AuthService _authService;

  UserCubitCubit({
    required UserRepository userRepository, 
    required AuthService authService}) : _userRepository = userRepository, _authService = authService,
   super(UserCubitInitial());

  Future<void> saveUser(UserModel user) async {
    var userRepository = await _userRepository.update(user: user);
    if (userRepository != null) {
      _authService.user = userRepository;
    }
  }
}
