// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  TextEditingController data2 =
      TextEditingController(text: '${HomeController.result?.code}');
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: controller.onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }
}
