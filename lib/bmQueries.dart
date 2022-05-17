import 'dart:async';
import 'package:sqflite/sqflite.dart';

import 'bmModel.dart';
import 'dbHelper.dart';

DBProvider dbProvider = DBProvider();

class BmQueries {
  final String _bMarks = 'bkmarks'; // table name

  Future<void> saveBookMark(BmModel model) async {
    final db = await dbProvider.database;
    await db.insert(
      _bMarks,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteBookMark(int id) async {
    final db = await dbProvider.database;
    await db.delete(_bMarks, where: "id = ?", whereArgs: [id]);
  }

  Future<List<BmModel>> getBookMarkList() async {
    final db = await dbProvider.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT id, title, subtitle, detail, page FROM $_bMarks ORDER BY id DESC");

    return List.generate(maps.length, (i) {
      return BmModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        subtitle: maps[i]['subtitle'],
        detail: maps[i]['detail'],
        page: maps[i]['page'],
      );
    });
  }
}
