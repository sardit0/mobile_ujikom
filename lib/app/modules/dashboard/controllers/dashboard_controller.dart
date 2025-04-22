import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ujikom_adit/app/data/book_response.dart';
import 'package:ujikom_adit/app/modules/dashboard/views/history_view.dart';
import 'package:ujikom_adit/app/modules/dashboard/views/index_view.dart';
import 'package:ujikom_adit/app/modules/dashboard/views/profile_view.dart';
import 'package:ujikom_adit/app/modules/peminjaman/views/peminjaman_view.dart';
import 'package:ujikom_adit/app/utils/api.dart';

class DashboardController extends GetxController {
    var selectedIndex = 0.obs;
      final _getConnect = GetConnect();
  final token = GetStorage().read('token');

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    IndexView(),
    // PeminjamanView(),
    HistoryView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
/*************  ✨ Windsurf Command ⭐  *************/
/// Called when the controller is ready for use. Override this method to perform
/// any initialization that should occur after the controller is fully prepared.
/// This method is executed after onInit and before the UI is displayed.

/*******  faecb7aa-f30c-44f4-aadf-c7e2f13d5b02  *******/
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}