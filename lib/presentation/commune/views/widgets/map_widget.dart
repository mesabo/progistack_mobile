import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:progistack_mobile/presentation/commune/controllers/commune.controller.dart';

import '../../../../infrastructure/dal/models/commune.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final PopupController popupController = PopupController();
  var communeController = Get.put(CommuneController());

  @override
  void initState() {
    communeController.markers.forEach((element) {
      print(element);
    });
    super.initState();
  }

  Address selectedAdresse = Address(
    name: '',
  );

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: communeController.points.first,
        zoom: 5,
        maxZoom: 17,
        onTap: (_, __) => popupController
            .hideAllPopups(), // Hide popup when the map is tapped.
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(5.29073882785688, -3.9988274129297983),
              builder: (context) => Container(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 45.0,
                ),
              ),
            ),
          ],
        ),
        Obx(() => MarkerClusterLayerWidget(
              options: MarkerClusterLayerOptions(
                spiderfyCircleRadius: 80,
                spiderfySpiralDistanceMultiplier: 2,
                circleSpiralSwitchover: 12,
                maxClusterRadius: 120,
                rotate: true,
                size: const Size(40, 40),
                anchor: AnchorPos.align(AnchorAlign.center),
                fitBoundsOptions: const FitBoundsOptions(
                  padding: EdgeInsets.all(50),
                  maxZoom: 17,
                ),
                markers: communeController.markers.value,
                polygonOptions: const PolygonOptions(
                    borderColor: Colors.amber,
                    color: Colors.black12,
                    borderStrokeWidth: 3),
                popupOptions: PopupOptions(
                    popupState: PopupState(),
                    popupSnap: PopupSnap.markerTop,
                    popupController: popupController,
                    popupBuilder: (_, marker) => Container(
                          width: 250,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.amber.shade200,
                              borderRadius: BorderRadius.circular(15)),
                          child: GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Text(
                                  '${communeController.selectedAdresse.value.name}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  communeController.distance.value >= 1
                                      ? 'Situé à ${communeController.distance.value.toStringAsFixed(2)} km'
                                      : 'Situé à ${(communeController.distance.value * 1000).round()} m',
                                ),
                                communeController.isLoading.value
                                    ? CircularProgressIndicator()
                                    : Column(
                                        children: [
                                          Text(
                                            'Lat: ${communeController.selectedAdresse.value.marker!.point.latitude}',
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                Text(
                                  'Long: ${communeController.selectedAdresse.value.marker!.point.latitude}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        )),
                onClusterTap: (p0) {
                  print(p0.markers.toList());
                },
                onMarkerTap: (p0) async {
                  communeController.pickAddress(p0);
                  await communeController.getDistance(p0);

                  print(p0.point.toJson());
                },
                builder: (context, markers) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber),
                    child: Center(
                      child: Text(
                        markers.length.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            )),
      ],
    );
  }
}
