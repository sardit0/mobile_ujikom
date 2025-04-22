import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:ujikom_adit/app/controllers/index_controller.dart';

class HistoryView extends StatelessWidget {
  final controller = Get.put(IndexController());

  String formatDate(String? dateStr) {
    if (dateStr == null) return "-";
    final date = DateTime.tryParse(dateStr);
    return date != null ? DateFormat('dd MMM yyyy').format(date) : "-";
  }

  Color getStatusColor(String? status) {
    switch (status) {
      case 'Dikembalikan':
        return Colors.green;
      case 'Terlambat':
        return Colors.red;
      case 'Dipinjam':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData getStatusIcon(String? status) {
    switch (status) {
      case 'Dikembalikan':
        return Icons.check_circle;
      case 'Terlambat':
        return Icons.warning;
      case 'Dipinjam':
        return Icons.schedule;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Riwayat Peminjaman'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/loading.json',
              width: 150,
            ),
          );
        }

        if (controller.historyList.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/lottie/empty.json',
                  width: 200,
                ),
                SizedBox(height: 12),
                Text(
                  'Belum ada riwayat peminjaman',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: controller.historyList.length,
          itemBuilder: (context, index) {
            final item = controller.historyList[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      getStatusIcon(item.status),
                      color: getStatusColor(item.status),
                      size: 36,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.nama ?? 'Tanpa Nama',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          // Text('📖 Buku: ${item.idBuku}'),
                          Text('📅 Tanggal Pinjam: ${formatDate(item.tanggalMinjem)}'),
                          Text('⏳ Batas Pengembalian: ${formatDate(item.batasTanggal)}'),
                          Text('🔄 Tanggal pengembalian: ${formatDate(item.tanggalKembali)}'),
                          Text('💸 Denda: Rp${item.denda ?? 0}'),
                          SizedBox(height: 6),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: getStatusColor(item.status).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Status: ${item.status ?? "-"}',
                              style: TextStyle(
                                color: getStatusColor(item.status),
                                fontWeight: FontWeight.w600,
                              ),
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
        );
      }),
    );
  }
}
