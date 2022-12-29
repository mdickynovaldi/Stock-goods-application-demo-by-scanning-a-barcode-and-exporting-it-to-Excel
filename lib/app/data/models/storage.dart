// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class StorageFields {
  static final String code = 'code';
  static final String id = 'id';
  static final String nama = 'nama';
  static final String exp = 'exp';

  static List<String> getFields() => [code, id, nama, exp];
}

class Storage {
  final String code;
  final String id;
  final String name;
  final String exp;

  const Storage({
    required this.code,
    required this.id,
    required this.name,
    required this.exp,
  });

  Map<String, dynamic> toJson() => {
        StorageFields.code: code,
        StorageFields.id: id,
        StorageFields.nama: name,
        StorageFields.exp: exp,
      };
}
