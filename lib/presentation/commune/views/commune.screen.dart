import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:progistack_mobile/presentation/commune/views/widgets/map_widget.dart';

import '../../../domain/use_cases/request_location_permission_use_case.dart';
import '../controllers/commune.controller.dart';

class CommuneScreen extends StatefulWidget {
  const CommuneScreen({super.key});

  @override
  State<CommuneScreen> createState() => _CommuneScreenState();
}

class _CommuneScreenState extends State<CommuneScreen> {
  final communeController = Get.put(CommuneController());
  Location location = Location();
  late PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> checkPermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.deniedForever) {
      _permissionGranted = await location.requestPermission();
    }
    setState(() {});
  }

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Display map view
          FutureBuilder(
            future: checkPermission(),
            builder: (context, snapshot) {
              if (_permissionGranted == PermissionStatus.granted ||
                  _permissionGranted == PermissionStatus.grantedLimited) {
                return const MapWidget();
              }
              return const ListTile(
                title: Text("Autorisation de localisation refusée."),
                subtitle: Text('cliquer pour autoriser'),
                trailing: Icon(Icons.place),
              );
            },
          ),

          /// Display back button
          Positioned(
            top: 50,
            left: 10,
            child: FloatingActionButton(
              onPressed: () => Get.back(),
              elevation: 0,
              child: const Icon(CupertinoIcons.back),
            ),
          ),
          if (communeController.distance.value > 0)
            Align(
                alignment: Alignment.bottomCenter,
                child: Obx(() => Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.amber,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Ma Position',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.linear_scale_rounded),
                                    Text(
                                      communeController.distance.value >= 1
                                          ? '${communeController.distance.value.toStringAsFixed(2)} km'
                                          : '${(communeController.distance.value * 1000).round()} m',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.purple.shade800),
                                    ),
                                    const Icon(Icons.double_arrow_rounded),
                                  ],
                                ),
                                Text(
                                  communeController.selectedAdresse.value.name!
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ]),
                    )))
        ],
      ),
    );
  }
}
