// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr/api/sheets/storage_sheets_api.dart';
import 'package:qr/app/data/models/storage.dart';
import 'package:qr/app/modules/home/views/home_view.dart';

import '../controllers/upload_exel_controller.dart';

class UploadExelView extends GetView<UploadExelController> {
  TextEditingController controllerBarang = TextEditingController();
  TextEditingController controllerQuantitiy = TextEditingController();
  TextEditingController controllerExp = TextEditingController();
  UploadExelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UploadExelView'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 300,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: HomeView().data2,
                    readOnly: true,
                    initialValue: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Code",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: controllerBarang,
                    initialValue: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Barang",
                      hintText: "Nama Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: controllerQuantitiy,
                    keyboardType: TextInputType.number,
                    initialValue: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Quantity",
                      hintText: "Jumlah Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: controllerExp,
                    initialValue: null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Exp",
                      hintText: "Tanggal Exp",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () async {
                    final barang = {
                      StorageFields.code: HomeView().data2.text,
                      StorageFields.id: controllerQuantitiy.text,
                      StorageFields.nama: controllerBarang.text,
                      StorageFields.exp: controllerExp.text,
                      // code: HomeView().data2.text,
                      // id: controllerQuantitiy.text,
                      // name: controllerBarang.text,
                      // exp: controllerExp.text,
                    };
                    await StorageSheetApi.insert([barang]);
                    var snackBar = SnackBar(
                      content: Text("Berhasil di upload"),
                      backgroundColor: Colors.teal,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(50),
                      elevation: 30,
                      // behavior: SnackBarBehavior.floating,
                    );
                    controller.onClose();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
