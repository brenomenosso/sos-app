import 'package:dio/dio.dart';
import 'package:sos_app/src/repositories/location/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {

  final Dio _dio;

  LocationRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<bool> distressOff({required String sessionToken}) async {
    final response = await _dio.post('/distressOff', data: {
      'sessionToken': sessionToken,
    });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
  
  @override
  Future<bool> distressOn({required String sessionToken, required int latitude, required int longitude}) async {
    final response = await _dio.post('/distressOn', data: {
      'sessionToken': sessionToken,
      'latitude': latitude,
      'longitude': longitude
    });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
  
  @override
  Future<bool> neaby({required String sessionToken}) async {
    final response = await _dio.post('/getNearby', data: {
      'sessionToken': sessionToken,
    });
    if (response.statusCode == 200) {
      print(response.data);
      return true;
    }
    return false;
  }

}