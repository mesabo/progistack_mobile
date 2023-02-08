import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:progistack_mobile/infrastructure/dal/models/commune.dart';

class HomeController extends GetxController {
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

  List<Commune> communeList = [
    /// `COMMUNE COCODY`
    Commune(id: 1, name: 'Cocody', address: [
      Address(
        name: 'Commerce C11',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.373980354724982, -3.9993199475291825),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce C12',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.374993117190584, -3.991472142766997),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce C13',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.395330658844984, -3.959028142861355),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce C14',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.361833169309164, -3.9839190422598634),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce C15',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.367644090405199, -3.9428919735961157),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce C16',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.373980354724982, -3.9993199475291825),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
    ]),

    /// `COMMUNE TOPOUGON`
    Commune(id: 1, name: 'Yopougon', address: [
      Address(
        name: 'Commerce Y11',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.336892453993532, -4.081545783131868),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce Y12',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.3341577723123, -4.088755560888678),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce Y13',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.331935834472455, -4.068671179994709),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce Y14',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.33672153674561, -4.07519431225087),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce Y15',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.339798039919716, -4.063521338739845),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
    ]),

    /// `COMMUNE PORT-BOUET`
    Commune(id: 1, name: 'Port Bouet', address: [
      Address(
        name: 'Commerce PB11',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.31604019835999, -3.9958867556615196),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce PB12',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.302537131562507, -3.9543447028722847),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce PB13',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.2977511635367955, -3.995715094286357),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce PB14',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.295529094350245, -3.9845571049008193),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
      Address(
        name: 'Commerce PB15',
        marker: Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(5.2958709516681735, -3.9751157292669017),
          builder: (ctx) => const Icon(
            Icons.pin_drop,
            color: Colors.green,
            size: 36,
          ),
        ),
      ),
    ]),
  ];
}
