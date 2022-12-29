// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr/app/modules/pendataan/views/pendataan_view.dart';
import 'package:qr/app/routes/app_pages.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeController extends GetxController {
  static Barcode? result;

  // ignore: todo
  //TODO: Implement HomeController

  @override
  void onInit() {
    print('hello');
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

  void onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen(
      (scanData) {
        result = scanData;
        if (result != null) {
          Get.toNamed(Routes.UPLOAD_EXEL);
        }
      },
    );
  }
}
