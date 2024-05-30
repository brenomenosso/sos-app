import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sos_app/model/user_model.dart';
import 'package:sos_app/src/repositories/location/location_repository.dart';
import 'package:sos_app/src/services/auth/auth_service.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final LocationRepository _repository;
  final AuthService _authService;

  MapCubit(
      {required LocationRepository repository,
      required AuthService authService})
      : _repository = repository,
        _authService = authService,
        super(MapInitial());

  Future<void> nearby() async {
    emit(MapLoading());
    await getLocation();
  }

  Future<void> getLocation() async {
    final users =
        await _repository.neaby(sessionToken: _authService.user!.sessionToken);

    if (users != null) {
      if (users.isEmpty) {
        emit(MapEmpty());
        return;
      } else {
        emit(MapLoaded(users));
      }
    } else {
      emit(MapError('Erro ao buscar usuários próximos'));
    }
  }
}
