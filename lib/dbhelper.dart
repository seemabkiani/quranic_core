import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/lifecycle.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qurani_cures_p/disease.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._privateConstructor();
  static Database? _database;

  DBHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database.db");

    // Check if the database file exists
    bool databaseExists = await databaseExistsAtPath(path);

    // If the database doesn't exist, copy the pre-populated database from the assets folder
    if (!databaseExists) {
      await copyPrePopulatedDatabase(path);
    }

    return await openDatabase(path);
  }

  Future<bool> databaseExistsAtPath(String path) async {
    return await databaseFactory.databaseExists(path);
  }

  Future<void> copyPrePopulatedDatabase(String path) async {
    ByteData data = await rootBundle.load(join("assets", "database.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }

  // GET ALL SURAH
  Future<List<Map<String, dynamic>>> getAllSurah() async {
    DBHelper dbHelper = DBHelper.instance;
    Database? db = await dbHelper.database;
    List<Map<String, dynamic>> result = await db!.query('Surah');
    return result;
  }

  saveCategory(String name, File image) async {
    Uint8List imageBytes = image.readAsBytesSync();
    final base64Image = base64Encode(imageBytes);
    DBHelper dbHelper = DBHelper.instance;
    Database? db = await dbHelper.database;

    Map<String, dynamic> data = {'Category_Name': name, 'Image': base64Image};

    int id = await db!.insert('Category', data);
    print('Category Saved with id : $id');
  }

  getCategory() async {
    DBHelper dbHelper = DBHelper.instance;
    Database? db = await dbHelper.database;
    List<dynamic> allCategories = await db!.query('Category');
    print('Total Length in table : ${allCategories.length}');
    return allCategories;
  }

  deleteCategory(int id) async {
    DBHelper dbHelper = DBHelper.instance;
    Database? db = await dbHelper.database;

    int count = await db!.delete('Category', where: 'id = ?', whereArgs: [id]);
    if (count > 0) {
      print('Category Deleted');
    }
  }

  deleteCategories() async {
    DBHelper dbHelper = DBHelper.instance;
    Database? db = await dbHelper.database;

    int count = await db!.delete('Category', where: 'id > ?', whereArgs: [0]);
    print('Deleted Row : ${count}');
  }

  getAllTable() async {
    DBHelper dbHelper = DBHelper.instance;
    Database? db = await dbHelper.database;
    final tables =
        await db!.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    List<String> list = tables.map((row) => row['name'] as String).toList();
    print(list.length);
  }

  getDisease(int id) async {
    DBHelper dbHelper = DBHelper.instance;
    Database? db = await dbHelper.database;
    List<dynamic> fetchByCategory =
        await db!.query('disease', where: "id=?", whereArgs: [id]);
    print("fetch by Category ${fetchByCategory.length}");
  }
}
