// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:qr/app/modules/home/views/home_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PendataanController extends GetxController {
  // ignore: todo
  //TODO: Implement PendataanController

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

  Future<void> launchUrl(Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
        );
      }
    } catch (e) {}
  }
}
