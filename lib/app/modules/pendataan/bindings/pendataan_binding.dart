import 'package:get/get.dart';

import '../controllers/pendataan_controller.dart';

class PendataanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendataanController>(
      () => PendataanController(),
    );
  }
}
