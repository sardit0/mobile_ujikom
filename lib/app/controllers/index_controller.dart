import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ujikom_adit/app/data/book_response.dart';
import 'package:ujikom_adit/app/data/history_response.dart';
import 'package:ujikom_adit/app/utils/api.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';

class IndexController extends GetxController {
  var isLoading = false.obs;
  var daftarBuku = <Buku>[].obs;  
  var historyList = <Minjem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBuku(); // langsung panggil saat controller diinisialisasi
    fetchHistory(); // langsung panggil saat controller diinisialisasi
  }

  Future<String?> getToken() async {
    final box = GetStorage();
    return box.read('token');
  }

  Future<void> fetchBuku() async {
    try {
      isLoading.value = true;
      String? token = await getToken();
      String fullUrl = '${BaseUrl.baseUrl}${BaseUrl.home}'; // ganti sesuai endpoint yang benar

      debugPrint("📡 Fetching: $fullUrl");
      debugPrint("🔑 Token: $token");

      final response = await GetConnect().get(
        fullUrl,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      debugPrint("📦 Response status: ${response.statusCode}");
      debugPrint("📦 Response body: ${response.body}");

      if (response.statusCode == 401) {
        Get.offAllNamed('/login');
        return;
      }

      if (response.body == null || response.body['buku'] == null) {
        daftarBuku.clear();
        debugPrint("⚠️ Tidak ada data buku.");
        return;
      }

      final List<dynamic> data = response.body['buku'];

      daftarBuku.assignAll(data.map((e) => Buku.fromJson(e)).toList());
      debugPrint("✅ Jumlah buku: ${daftarBuku.length}");
    } catch (e) {
      debugPrint("❌ Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void fetchHistory() async {
    try {
      isLoading(true);
      String? token = await getToken();
      String fullUrl = '${BaseUrl.baseUrl}${BaseUrl.addpeminjaman}';

      final response = await http.get(
        Uri.parse(fullUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final history = HistoryResponse.fromJson(data);
        if (history.success == true) {
          historyList.value = history.minjem ?? [];
        } else {
          Get.snackbar('Gagal', history.message ?? 'Tidak bisa memuat data');
        }
      } else {
        Get.snackbar('Error', 'Server error: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }
}
