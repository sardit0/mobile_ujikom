import 'package:flutter/material.dart';
import 'package:ujikom_adit/app/data/book_response.dart' as br;

class BookDetailView extends StatelessWidget {
  final br.Buku buku;
  const BookDetailView({super.key, required this.buku});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7), // 🌤️ Latar belakang adem
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(buku.judul ?? 'Detail Buku'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // 🧼 Kartu bersih
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
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
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    'Tahun Terbit: ${buku.tahunPenerbit ?? '-'}',
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.library_books, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    '${buku.jumlahBuku} Buku tersedia',
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Deskripsi:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                buku.desk ?? 'Tidak ada deskripsi.',
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
