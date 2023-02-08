import 'package:flutter/services.dart';
import 'package:location/location.dart';

class GetCurrentLocationUseCase {
  final Location _location;

  GetCurrentLocationUseCase(this._location);

  Future<LocationData> call() async {
    return await _location.getLocation();
  }
}
