import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:ujikom_adit/app/controllers/index_controller.dart';
import 'package:ujikom_adit/app/data/book_response.dart' as br;
import 'package:ujikom_adit/app/data/book_detail_response.dart' as bd;
import 'package:ujikom_adit/app/modules/dashboard/views/book_detail_view.dart'; // pastikan path ini sesuai ya

class IndexView extends GetView<IndexController> {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IndexController());
    final String? idUser = GetStorage().read('token');

    if (idUser == null) {
      return Scaffold(
        body: const Center(
          child: Text("User tidak ditemukan, silakan login ulang."),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(178, 243, 244, 246),
      appBar: AppBar(
        title: const Text('📚 Perpustakaan Digital'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: Lottie.network(
                'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
                repeat: true,
                width: MediaQuery.of(context).size.width / 1,
              ),
            );
          }

          if (controller.daftarBuku.isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi, selamat datang! 👋",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Temukan buku favoritmu di sini.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Buku Populer 📚",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // 👉 Horizontal ListView untuk buku populer
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        controller.daftarBuku.length >= 5
                            ? 5
                            : controller.daftarBuku.length,
                    itemBuilder: (context, index) {
                      final br.Buku buku = controller.daftarBuku[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => BookDetailView(buku: buku));
                        },
                        child: Container(
                          width: 140,
                          margin: const EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'http://127.0.0.1:8000/images/buku/${buku.image}',
                                  height: 160,
                                  width: 140,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Center(child: Text('No image')),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                buku.judul ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),
                const Text(
                  "Semua Buku 📖",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // 👉 GridView daftar semua buku
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: controller.daftarBuku.length,
                  itemBuilder: (context, index) {
                    final br.Buku buku = controller.daftarBuku[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => BookDetailView(buku: buku));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                'http://127.0.0.1:8000/images/buku/${buku.image}',
                                fit: BoxFit.cover,
                                height: 250,
                                width: double.infinity,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const SizedBox(
                                          height: 150,
                                          child: Center(
                                            child: Text('Image not found'),
                                          ),
                                        ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    buku.judul ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${buku.jumlahBuku} Buku tersedia',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
