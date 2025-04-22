import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFFF3F4F6), // 🌤 Ganti latar belakang biar adem
        body: Navigator(
          key: Get.nestedKey(1),
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (_) => controller.pages[controller.selectedIndex.value],
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white, // bar putih bersih
          selectedItemColor: Colors.deepPurple, // warna aktif
          unselectedItemColor: Colors.grey[500], // warna pasif
          showUnselectedLabels: true,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
            Get.nestedKey(1)!.currentState!.pushReplacement(
              MaterialPageRoute(
                builder: (_) => controller.pages[index],
              ),
            );
          },
          items: const [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: 'Home',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
