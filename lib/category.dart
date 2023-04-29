import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qurani_cures_p/dboard.dart';
import 'package:qurani_cures_p/dua.dart';
import 'package:qurani_cures_p/disease.dart';
import 'dbhelper.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

//TextEditingController searchCtrl = TextEditingController();

class _CategoryState extends State<Category> {
  final _textController = TextEditingController();

  @override //
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Category'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Category name',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
                flex: 20,
                child: Center(
                  child: image == null ? withoutImage() : withImage(),
                )),
            Expanded(
              flex: 20,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        selectImage();
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        color: Colors.teal,
                        child: Center(
                          child: Text(
                            ' Select from Gallery',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        if (image != null && _textController.text.isNotEmpty) {
                          DBHelper database = DBHelper.instance;
                          await database.saveCategory(
                              _textController.text, image!);
                          Get.to(DashBoard());
                        }
                      },
                      child: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(Disease());
                          },
                          child: Center(
                              child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  File? image;

  withoutImage() {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.teal,
      height: 200,
      child: Center(
          child: Icon(
        Icons.image,
        color: Colors.white,
        size: 80,
      )),
    );
  }

  withImage() {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.teal,
      height: 200,
      child: Center(child: Image.file(image!)),
    );
  }

  selectImage() async {
    ImagePicker imagePicker = ImagePicker();
    var selectedimage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedimage != null) {
      image = File(selectedimage.path);
      setState(() {});
    }
  }
}
