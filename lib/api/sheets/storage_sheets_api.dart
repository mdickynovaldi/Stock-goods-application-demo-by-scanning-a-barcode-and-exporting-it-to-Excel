// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:qr/app/data/models/storage.dart';

class StorageSheetApi {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "gsheed",
  "private_key_id": "99d9264ba7b9b9c80640c0c34a7533a6fee18191",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxqPdo6kDj/2RB\nMoSBWt0PXn/h6YQQCHMFdHjAQYxo9g0v3bqcr2au9BR6KpQqZBqYXyB75sZa8N+4\nCxFg+UpqT1PDYQGMOaU+0pG6HvUkqe1svhtyHFWCX2HKkV6yLcpNbzYf+8tB8o6Q\niCR2WBh5eiO9zkHw8o47qdS39IKkG7N4mymI2Ksv4aBIqYSDFFWelgVJ464Q6nis\njGRFTCStF5ZfOh+b3Yl8gmrr+LoaLs0apmmlxqrZrWNO1wCbZi1fPF9LqGmNvU17\nOY5JwkIIj7UCDFIMtx9i0weypvlPdspG2r0c35+HfwmBNtASqyjEZVUUdGNhZFcU\n+Fz04pajAgMBAAECggEAAlmFaYFCTx4Z7wNCXZsqmYg3NP9dUaswRc/dGWz2Shym\nF8cyaE9wPQKShPuP2XAf8Xpom3dZWOs7T5ScHa05DRHJhURWLlkn8R411ohzZVho\nq5ZLMtsNTSLmCPxijFpLWlabNPxq/sguly/iNyCz0UaY04d+fqlttNFqiZhOnSKQ\nxauAgzb8H7339PWo/nQmYM6uDBkhaLvMM20Z2CRXkYluJRojq7juWa9nXdvOSol/\n03+lI03sYWOZ2OhXX6G1fc+QXcjvjgVAKmFSgS9vpycDRAyIPocSqZaKdupNjEOL\nSqlX3FBqZBko7JhKW5uH7RdrkxI4bpltWPvj3ZPqmQKBgQDoft6ddmTCViJHrXM2\nXGMmMavQV0XLQdxYD9zGTDvnTAwzb2MCj+ExlLa20SHiFiY094NiIxD5Ntlorcpz\nQ6t5O4Kowgm9hime3NXx8TNpm2jYJVmy/vHtGWXgB0SqZ7L299dvhcbZ0y7VtgLD\negN+QQAz86PLiDeTvj9dtkPdBQKBgQDDnusgDw6aoat7k63WAoTVnq4Y9JDnrEZD\nO5eEAlQGevhABvUb6AFgKEEBq7SBrFg7CbqmSnHKpfN6fsx6L5p5eX2sKb1i3LXr\nkbWN41sLHinKiEnI+bEGHiWyxjsWU6NFjA+FSEGNNPzG0U8zxrqj7iSDqWQmlj0F\n1Z5lCKs1hwKBgD/PSkQHUYIw57mqdjuOQbwi19gXi9VMXzBgMiTOmYZSzep0AMWc\nPZ9BBKDKZzVJBPV2lT2jCC6OCj97q1vVT8O3PJYao1e78cJjM+jyXTz35V+laKgC\n5t0/IkHJXOQ0D99OiHdYTQpNtsX67Wk/HKRTLL4VeXgMC8zl4zhSJPANAoGAVKte\nPZwGyCsdm/lJjo28jPGHjUmdxoisSMFsTTjswXlMJfpc8N00azhBGsYE9PNxpOwL\nG5qxMfMuNWDYhDJCfD13haLzU+0P2IxStr0nVOKTWBQxS4m3c1xtGLnwLTO6QYnj\n1d52cPX0SuGhlFl5wyZ6K3qP3Ju+gd36FuTvpdUCgYEAuiquMpSDW1+GMhWLDSBW\n0kpg+MMLERxeVctHGWJu818dBXIypGmFipFiW9+JhxJB9o9lr6A6OyTHesss78Fc\nuam20LQgj7fT9mfZD4yx/rpqKksSpzQ5s/CItfcfr7UCXhrYINACrrdGtO9g10Hv\nvTCZ5x8spQLkjENng08socU=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheed.iam.gserviceaccount.com",
  "client_id": "112077409604931764924",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheed.iam.gserviceaccount.com"
}
''';
  static final _spreadsheetId = '1zISgaqRozk88K4iDUY54Qk03tweRFH_d0AjpbUK7iQ0';
  static final _gshets = GSheets(_credentials);
  static Worksheet? _storageSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gshets.spreadsheet(_spreadsheetId);
      _storageSheet = await _getWorkSheet(spreadsheet, title: 'Storage');

      final firstRow = StorageFields.getFields();
      _storageSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_storageSheet == null) return;
    _storageSheet!.values.map.appendRows(rowList);
  }
}
