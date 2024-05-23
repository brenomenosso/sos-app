abstract interface class LocationRepository {
  
  Future<bool> distressOn({required String sessionToken,required int latitude,required int longitude,});
  Future<bool> distressOff({required String sessionToken});
  Future<bool> neaby({required String sessionToken});
} 