import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sos_app/src/repositories/location/location_repository.dart';
import 'package:sos_app/src/services/auth_service.dart';

part 'sos_state.dart';

class SosCubit extends Cubit<SosState> {

  final LocationRepository _repository;
  final AuthService _authService;

  SosCubit({
    required LocationRepository repository,
    required AuthService authService
    }) : _repository = repository, _authService = authService , super(SosInitial());

  Future<bool> acionarSos() async {
    await _repository.distressOn( sessionToken: _authService.user!.sessionToken, latitude: 0, longitude: 0);
    emit(SosOnDistress());
    return true;
  }

  Future<void> desativarSos() async {
    await _repository.distressOff(sessionToken: _authService.user!.sessionToken);
    emit(SosOffDistress());
  }
}
