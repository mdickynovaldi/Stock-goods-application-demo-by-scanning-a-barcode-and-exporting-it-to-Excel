// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr/app/modules/home/views/home_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../controllers/pendataan_controller.dart';

class PendataanView extends GetView<PendataanController> {
  const PendataanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PendataanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              height: 50,
              // child: TextField(
              //   readOnly: true,
              //   textAlign: TextAlign.center,
              //   controller: HomeView().data2,
              // ),
              child: Container(
                child: TextFormField(
                  controller: HomeView().data2,
                  readOnly: true,
                  initialValue: null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse(HomeView().data2.text);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('error');
                }
                print(url);
              },
              child: Text("GO"),
            )
          ],
        ),
      ),
    );
  }
}
