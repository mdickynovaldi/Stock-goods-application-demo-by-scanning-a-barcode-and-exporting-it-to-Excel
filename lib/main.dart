import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr/api/sheets/storage_sheets_api.dart';
import 'package:qr/app/modules/home/bindings/home_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageSheetApi.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
