import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurani_cures_p/category.dart';

import 'dbhelper.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

List<dynamic> allCategories = [];

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    getAlCategories();
    super.initState();
  }

  getAlCategories() async {
    DBHelper database = DBHelper.instance;
    // database.deleteCategories();
    allCategories = await database.getCategory();
    print('Categories length : ${allCategories.length}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            //title: Text("Dashboard"),
          ),
          body: ListView.builder(
              itemCount: allCategories.length,
              itemBuilder: (context, index) {
                return CategoryWidget(
                  categoryName: allCategories[index]['Category_Name'],
                  imageUrl: base64Decode(allCategories[index]['Image']),
                  id: allCategories[index]['id'],
                  refreshData: getAlCategories,
                );
              }),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(Category());
              },
              backgroundColor: Colors.teal,
              child: Icon(Icons.add)),
          backgroundColor: Colors.white,
          bottomNavigationBar: navBar()),
    );
  }

  navBar() {
    return Container(
      height: 50,
      color: Colors.teal,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                navIcon(Icons.home, 1),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                navIcon(Icons.category, 2),
                Text(
                  'Add Cate',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                navIcon(Icons.sick, 3),
                Text(
                  'Add Dis',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                navIcon(Icons.water_drop, 4),
                const Text(
                  'Add Dua',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  navIcon(IconData icon, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == 1) {
            print('Home');
          } else if (index == 2) {
            // ignore: avoid_print
            print('Move Category Page');
          } else if (index == 3) {
            print('Move Add Disease');
          } else {
            print('Move add dua');
          }
        },
        child: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final Uint8List imageUrl;
  final int id;
  final Function refreshData;

  const CategoryWidget(
      {Key? key,
      required this.categoryName,
      required this.imageUrl,
      required this.id,
      required this.refreshData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () async {
        DBHelper database = DBHelper.instance;
        await database.deleteCategory(id);
        refreshData();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(color: Colors.teal, width: 5),
          color: Colors.tealAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.memory(
                imageUrl,
                fit: BoxFit.fitHeight,
                height: 150,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  categoryName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
