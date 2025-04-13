import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ujikom_adit/app/data/book_response.dart';

class BookDetailView extends StatelessWidget {
  final Buku buku;
  const BookDetailView({super.key, required this.buku});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ======== GAMBAR BUKU =========
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      buku.image ?? 'https://via.placeholder.com/700x300.png?text=No+Image',
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          height: 250,
                          child: Center(child: Text('Image not found')),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${buku.jumlahBuku ?? 0} Buku',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ======== DETAIL BUKU =========
              Text(
                buku.judul ?? "Judul tidak tersedia",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildDetailRow('Deskripsi', buku.desk),
              _buildDetailRow('Tahun Terbit', buku.tahunPenerbit),
              _buildDetailRow('ID Penulis', buku.idPenulis?.toString()),
              _buildDetailRow('ID Penerbit', buku.idPenerbit?.toString()),
              _buildDetailRow('ID Kategori', buku.idKategori?.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text.rich(
        TextSpan(
          text: "$title: ",
          style: const TextStyle(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: value ?? "Tidak tersedia",
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
