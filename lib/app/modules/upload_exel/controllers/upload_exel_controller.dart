import 'package:get/get.dart';
import 'package:qr/app/modules/home/views/home_view.dart';
import 'package:qr/app/modules/upload_exel/views/upload_exel_view.dart';

class UploadExelController extends GetxController {
  // ignore: todo
  //TODO: Implement UploadExelController

  final count = 0.obs;
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
    UploadExelView().controllerBarang.clear();
    UploadExelView().controllerExp.clear();
    UploadExelView().controllerQuantitiy.clear();
    HomeView().data2.clear();
    super.onClose();
  }

  void deleteAll() {}

  void increment() => count.value++;
}
