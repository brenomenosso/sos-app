
import 'package:geolocator/geolocator.dart';

class LocatorService {

  bool service = false;
  Position? position;

  Future<void> getLocation() async {
    position = await Geolocator.getCurrentPosition();
  }

  Future<void> init() async {
    service = await Geolocator.isLocationServiceEnabled();
    if (!service) {
      return Future.error('Serviço de localização desativado');
    }
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão de localização negada');
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Permissão de localização negada permanentemente');
      }
    }
    position = await Geolocator.getCurrentPosition();
  }
}