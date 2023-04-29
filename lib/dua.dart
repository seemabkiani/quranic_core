import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurani_cures_p/treatment.dart';

class AddDua extends StatelessWidget {
  const AddDua({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Dua'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(children: [
            Image.asset(
              'image/img.jpg',
              height: 100,
              width: 100,
            ),
            Container(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Disease",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.white))),
            ),
            Container(height: 10),
            TextField(
              decoration: InputDecoration(
                  labelText: "Description",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            Container(height: 10),
            TextField(
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.arrow_drop_down, color: Colors.black)),
                  labelText: "Surah",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle:
                      const TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.black))),
            ),
            const SizedBox(height: 10),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'from',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(flex: 1),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                Spacer(),
                Text(
                  'to',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  'Counter',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(flex: 1),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: const [
                Text(
                  'Image',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                print("clicked");
              },
              child: Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text(
                  "save",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )),
              ),
            ),
            SizedBox(height: 50),
            FloatingActionButton(
                onPressed: () {
                  Get.to(Treatment());
                },
                child: const Icon(Icons.add),
                backgroundColor: Colors.teal),
          ]),
        ),
      ),
    );
  }
}
