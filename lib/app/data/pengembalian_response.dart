class PengembalianReponse {
  bool? success;
  String? message;
  List<Kembali>? kembali;

  PengembalianReponse({this.success, this.message, this.kembali});

  PengembalianReponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['kembali'] != null) {
      kembali = <Kembali>[];
      json['kembali'].forEach((v) {
        kembali!.add(new Kembali.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.kembali != null) {
      data['kembali'] = this.kembali!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kembali {
  int? id;
  int? jumlah;
  String? tanggalKembali;
  String? status;
  String? denda;
  int? idMinjem;
  int? idBuku;
  int? idUser;
  String? createdAt;
  String? updatedAt;

  Kembali(
      {this.id,
      this.jumlah,
      this.tanggalKembali,
      this.status,
      this.denda,
      this.idMinjem,
      this.idBuku,
      this.idUser,
      this.createdAt,
      this.updatedAt});

  Kembali.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jumlah = json['jumlah'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    denda = json['denda'];
    idMinjem = json['id_minjem'];
    idBuku = json['id_buku'];
    idUser = json['id_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jumlah'] = this.jumlah;
    data['tanggal_kembali'] = this.tanggalKembali;
    data['status'] = this.status;
    data['denda'] = this.denda;
    data['id_minjem'] = this.idMinjem;
    data['id_buku'] = this.idBuku;
    data['id_user'] = this.idUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
