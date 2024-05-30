import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sos_app/src/repositories/location/location_repository.dart';
import 'package:sos_app/src/services/auth/auth_service.dart';
import 'package:sos_app/src/services/locator/locator_service.dart';

part 'sos_state.dart';

class SosCubit extends Cubit<SosState> {
  final LocationRepository _repository;
  final AuthService _authService;
  final LocatorService _locationsService;

  SosCubit(
      {required LocationRepository repository,
      required AuthService authService,
      required LocatorService locationsService})
      : _repository = repository,
        _authService = authService,
        _locationsService = locationsService,
        super(SosInitial());

  Future<bool> acionarSos() async {
    await _repository.distressOn(
      sessionToken: _authService.user!.sessionToken,
      latitude: _locationsService.position!.latitude,
      longitude: _locationsService.position!.longitude,
    );
    emit(SosOnDistress());
    return true;
  }

  Future<void> desativarSos() async {
    await _repository.distressOff(
        sessionToken: _authService.user!.sessionToken);
    emit(SosOffDistress());
  }
}
