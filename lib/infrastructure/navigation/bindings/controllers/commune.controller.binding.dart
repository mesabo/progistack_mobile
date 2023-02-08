import 'package:get/get.dart';

import '../../../../presentation/commune/controllers/commune.controller.dart';

class CommuneControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommuneController>(
      () => CommuneController(),
    );
  }
}
