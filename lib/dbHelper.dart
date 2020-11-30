import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

import 'bmModel.dart';
import 'dbModel.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// atexts geloofbelydenis
// btexts Ecumenical creeds
// ctexts Kategismus
// dtexts Dort

class DBProvider {

  String _dbName = 'gelb.db';   // change db name to update
  String _bMarks = 'bkmarks';
  int _ver = 2;

  static DBProvider _dbProvider;
  static Database _database;

  DBProvider._createInstance();

  factory DBProvider() {
    if (_dbProvider == null) {
      _dbProvider = DBProvider._createInstance();
    }
    return _dbProvider;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async {

    Directory documentsDir = await getApplicationDocumentsDirectory();
    var path = join(documentsDir.path, _dbName);

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", _dbName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

    }

    return await openDatabase(path);

  }

/*  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "working_data.db");

  ByteData data = await rootBundle.load(join("assets", "stored_data.db"));
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await new File(path).writeAsBytes(bytes);*/

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  // void _onCreate(Database db, int version) async {
  //   await db.execute(
  //       'CREATE TABLE $_bMarks('
  //           'id INTEGER PRIMARY KEY,'
  //           'title TEXT,'
  //           'subtitle TEXT,'
  //           'detail TEXT,'
  //           'page TEXT'
  //           ')'
  //   );
  // }

  // void _onUpgrade(Database db, int oldVersion, int newVersion) async {
  //   await db.execute("DROP TABLE IF EXISTS $_bMarks");
  //   _onCreate(db, newVersion);
  // }

  Future close() async {
    return _database.close();
  }

  Future<void> saveBookMark(Model model) async {
    final db = await database;
    await db.insert(_bMarks, model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteBookMark(int id) async {
    final db = await database;
    await db.delete(_bMarks, where: "id = ?", whereArgs: [id]);
  }

  Future<List<Model>> getBookMarkList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT id, title, subtitle, detail, page FROM $_bMarks");

    return List.generate(maps.length, (i) {
      return Model(
        id: maps[i]['id'],
        title: maps[i]['title'],
        subtitle: maps[i]['subtitle'],
        detail: maps[i]['detail'],
        page: maps[i]['page'],
      );
    });
  }

  Future<List<Chapter>> getTitleList(String table) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT id, chap, title FROM $table");

    return List.generate(maps.length, (i) {
      return Chapter(
        id: maps[i]['id'],
        chap: maps[i]['chap'],
        title: maps[i]['title'],
        //text: maps[i]['text'],
      );
    });
  }

  Future<List<Chapter>> getChapters(String table) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT id, title, text FROM $table");

    return List.generate(maps.length, (i) {
      return Chapter(
        id: maps[i]['id'],
        //chap: maps[i]['chap'],
        title: maps[i]['title'],
        text: maps[i]['text'],
      );
    });
  }


}
