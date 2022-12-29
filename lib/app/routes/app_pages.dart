import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pendataan/bindings/pendataan_binding.dart';
import '../modules/pendataan/views/pendataan_view.dart';
import '../modules/upload_exel/bindings/upload_exel_binding.dart';
import '../modules/upload_exel/views/upload_exel_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.circularReveal),
    GetPage(
      name: _Paths.PENDATAAN,
      page: () => const PendataanView(),
      binding: PendataanBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_EXEL,
      page: () => UploadExelView(),
      binding: UploadExelBinding(),
    ),
  ];
}
