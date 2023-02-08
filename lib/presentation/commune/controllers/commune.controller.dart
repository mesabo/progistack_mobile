import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:progistack_mobile/infrastructure/dal/models/commune.dart';

import '../../../infrastructure/navigation/routes.dart';

class CommuneController extends GetxController {
  Rx<Commune> selectedCommune = Commune(id: 0, name: '').obs;
  Rx<Address> selectedAdresse = Address(
    name: '',
  ).obs;

  RxList<Marker> markers = <Marker>[].obs;

  RxInt pointIndex = 0.obs;
  RxList<LatLng> points = [
    LatLng(5.336892453993532, -4.081545783131868),
    LatLng(5.2977511635367955, -3.995715094286357)
  ].obs;

  final distance = 0.0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  pickAddress(Marker marker) {
    selectedAdresse.value = selectedCommune.value.address!
        .firstWhere((element) => element.marker == marker);
  }

  Future selectCommune(Commune value) async {
    markers.clear();
    selectedCommune.value = value;
    for (var address in value.address ?? []) {
      markers.add(address.marker);
    }
    points.first = value.address!.first.marker!.point;
    debugPrint('${markers.length}');
    Get.toNamed(Routes.COMMUNE);
  }

  // Calculer et retourner la distance entre deux position GPS fournies
  Future<double> getDistance(Marker marker) async {
    pickAddress(marker);
    isLoading.value = true;
    distance.value = Geolocator.distanceBetween(
            5.29073882785688,
            -3.9988274129297983,
            marker.point.latitude,
            marker.point.longitude) /
        1000;
    isLoading.value = false;
    return distance.value;
  }
}
