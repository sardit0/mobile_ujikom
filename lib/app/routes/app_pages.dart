import 'package:get/get.dart';

import '../modules/buku/bindings/buku_binding.dart';
import '../modules/buku/views/buku_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/peminjaman/bindings/peminjaman_binding.dart';
import '../modules/peminjaman/views/peminjaman_view.dart';
import '../modules/pengembalian/bindings/pengembalian_binding.dart';
import '../modules/pengembalian/views/pengembalian_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/controllers/profile_controller.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BUKU,
      page: () => const BukuView(),
      binding: BukuBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAM,
      page: () => const PeminjamanView(),
      binding: PeminjamBinding(),
    ),
    GetPage(
      name: _Paths.PENGEMBALIAN,
      page: () => const PengembalianView(),
      binding: PengembalianBinding(),
    ),
  ];
}
