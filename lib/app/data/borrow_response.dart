class BorrowResponse {
  bool? success;
  String? message;
  List<Minjem>? minjem;

  BorrowResponse({this.success, this.message, this.minjem});

  BorrowResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['minjem'] != null) {
      minjem = <Minjem>[];
      json['minjem'].forEach((v) {
        minjem!.add(new Minjem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.minjem != null) {
      data['minjem'] = this.minjem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Minjem {
  int? id;
  int? idUser;
  int? idBuku;
  int? jumlah;
  String? nama;
  String? tanggalMinjem;
  String? batasTanggal;
  String? tanggalKembali;
  int? denda;
  Null? alasan;
  String? status;
  String? createdAt;
  String? updatedAt;

  Minjem(
      {this.id,
      this.idUser,
      this.idBuku,
      this.jumlah,
      this.nama,
      this.tanggalMinjem,
      this.batasTanggal,
      this.tanggalKembali,
      this.denda,
      this.alasan,
      this.status,
      this.createdAt,
      this.updatedAt});

  Minjem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    idBuku = json['id_buku'];
    jumlah = json['jumlah'];
    nama = json['nama'];
    tanggalMinjem = json['tanggal_minjem'];
    batasTanggal = json['batas_tanggal'];
    tanggalKembali = json['tanggal_kembali'];
    denda = json['denda'];
    alasan = json['alasan'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['id_buku'] = this.idBuku;
    data['jumlah'] = this.jumlah;
    data['nama'] = this.nama;
    data['tanggal_minjem'] = this.tanggalMinjem;
    data['batas_tanggal'] = this.batasTanggal;
    data['tanggal_kembali'] = this.tanggalKembali;
    data['denda'] = this.denda;
    data['alasan'] = this.alasan;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
