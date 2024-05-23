import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sos_app/model/user_model.dart';
import 'package:sos_app/src/repositories/user/user_repository.dart';

class AuthService {
  final FlutterSecureStorage _storage;
  final UserRepository _repository;

  UserModel? user;

  AuthService(
      {required FlutterSecureStorage storage,
      required UserRepository repository})
      : _storage = storage,
        _repository = repository;

  Future<bool> login() async {
    _storage.deleteAll();
    final sessionToken = await _storage.read(key: 'sessionToken');

    //final userRepository = (sessionToken) != null ? _repository.me(sessionToken: sessionToken!) :  _repository.login();

    if (sessionToken == null) {
      final userRepository = await _repository.login();
      if (userRepository != null) {
        user = userRepository;
        await _storage.write(key: 'sessionToken', value: user?.sessionToken);
        return true;
      } else {
        return false;
      }
    } else {
      final userRepository = await _repository.me(sessionToken: sessionToken);
      user = userRepository;
      return true;
    }
  }
}
