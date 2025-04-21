import 'package:flutter/material.dart';
import 'package:ujikom_adit/app/data/book_response.dart' as br; // Pastikan path model ini sesuai dengan struktur project kamu

class BookDetailView extends StatelessWidget {
   final br.Buku buku;
  const BookDetailView({super.key, required this.buku});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(buku.judul ?? 'Detail Buku'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'http://127.0.0.1:8000/images/buku/${buku.image}',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 200,
                      child: Center(child: Text('Image not found')),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              buku.judul ?? 'Tanpa Judul',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Tahun Terbit: ${buku.tahunPenerbit ?? '-'}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.library_books, size: 18),
                const SizedBox(width: 8),
                Text(
                  '${buku.jumlahBuku} Buku tersedia',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              buku.desk ?? 'Tidak ada deskripsi.',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
