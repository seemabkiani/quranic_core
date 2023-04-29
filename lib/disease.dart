import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurani_cures_p/dua.dart';

class Disease extends StatelessWidget {
  const Disease({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Disease"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddDua());
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.teal),
      backgroundColor: Colors.white,
    );
  }
}
