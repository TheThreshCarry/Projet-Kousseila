import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  /*static Database _database;

  static Future<void> setup() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "app.db");

    ByteData data = await rootBundle.load("assets/db.sqlite3");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    print("Setuped the database correctly at : " +
        dbPath +
        " with " +
        bytes.length.toString() +
        " Bytes");
  }*/
}
