import 'package:permission_handler/permission_handler.dart';

class RequestLocationPermissionUseCase {
  Future<bool> call() async {
    final permissionStatus = await Permission.location.status;
    if (permissionStatus.isGranted) {
      return true;
    }

    final result = await Permission.location.request();
    return result.isGranted;
  }
}