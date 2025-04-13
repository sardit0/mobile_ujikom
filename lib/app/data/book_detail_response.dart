class BookDetailResponse {
  bool? success;
  String? message;
  List<Buku>? buku;

  BookDetailResponse({this.success, this.message, this.buku});

  BookDetailResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['buku'] != null) {
      buku = <Buku>[];
      json['buku'].forEach((v) {
        buku!.add(new Buku.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.buku != null) {
      data['buku'] = this.buku!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Buku {
  int? id;
  String? judul;
  String? desk;
  int? jumlahBuku;
  String? tahunPenerbit;
  String? image;
  int? idKategori;
  int? idPenerbit;
  int? idPenulis;
  String? createdAt;
  String? updatedAt;

  Buku(
      {this.id,
      this.judul,
      this.desk,
      this.jumlahBuku,
      this.tahunPenerbit,
      this.image,
      this.idKategori,
      this.idPenerbit,
      this.idPenulis,
      this.createdAt,
      this.updatedAt});

  Buku.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    desk = json['desk'];
    jumlahBuku = json['jumlah_buku'];
    tahunPenerbit = json['tahun_penerbit'];
    image = json['image'];
    idKategori = json['id_kategori'];
    idPenerbit = json['id_penerbit'];
    idPenulis = json['id_penulis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['desk'] = this.desk;
    data['jumlah_buku'] = this.jumlahBuku;
    data['tahun_penerbit'] = this.tahunPenerbit;
    data['image'] = this.image;
    data['id_kategori'] = this.idKategori;
    data['id_penerbit'] = this.idPenerbit;
    data['id_penulis'] = this.idPenulis;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
