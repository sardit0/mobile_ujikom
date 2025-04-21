import 'package:get/get.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanController>(
      () => PeminjamanController(),
    );
  }
}
