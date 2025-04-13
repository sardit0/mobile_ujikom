import 'package:flutter/foundation.dart';

class ProfileResponse {
  final int id;
  final String name;
  final String alamat;
  final String email;
  final String noHp;
  final String? fotoprofile;
  final String? emailVerifiedAt;
  final bool isAdmin;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfileResponse({
    required this.id,
    required this.name,
    required this.alamat,
    required this.email,
    required this.noHp,
    this.fotoprofile,
    this.emailVerifiedAt,
    required this.isAdmin,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    debugPrint("📥 Parsing ProfileResponse: $json");

    return ProfileResponse(
      id: json['id'] as int? ?? 0,
      name: json['name']?.toString() ?? "Unknown",
      alamat: json['alamat']?.toString() ?? "-",
      email: json['email']?.toString() ?? "-",
      noHp: json['no_hp']?.toString() ?? "-",
      fotoprofile: json['fotoprofile']?.toString(),
      emailVerifiedAt: json['email_verified_at']?.toString(),
      isAdmin: _parseBool(json['isAdmin']),
      createdAt: _parseDate(json['created_at']),
      updatedAt: _parseDate(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alamat': alamat,
      'email': email,
      'no_hp': noHp,
      'fotoprofile': fotoprofile,
      'email_verified_at': emailVerifiedAt,
      'isAdmin': isAdmin,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  static bool _parseBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) return value.toLowerCase() == 'true' || value == '1';
    return false;
  }

  static DateTime? _parseDate(dynamic date) {
    if (date == null) return null;
    try {
      return DateTime.parse(date.toString());
    } catch (e) {
      debugPrint("⚠️ Gagal parsing tanggal: $date");
      return null;
    }
  }
}
