import 'package:get/get.dart';

import '../controllers/upload_exel_controller.dart';

class UploadExelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadExelController>(
      () => UploadExelController(),
    );
  }
}
