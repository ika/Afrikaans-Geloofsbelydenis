import 'dart:async';

import 'dbModel.dart';
import 'dbHelper.dart';

// atexts geloofbelydenis
// btexts Ecumenical creeds
// ctexts Kategismus
// dtexts Dort

DBProvider dbProvider = DBProvider();

class DbQueries {
  Future<List<Chapter>> getTitleList(String table) async {
    final db = await dbProvider.database;

    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT id, chap, title FROM $table");

    return List.generate(
      maps.length,
      (i) {
        return Chapter(
          id: maps[i]['id'],
          chap: maps[i]['chap'],
          title: maps[i]['title'],
          //text: maps[i]['text'],
        );
      },
    );
  }

  Future<List<Chapter>> getChapters(String table) async {
    final db = await dbProvider.database;

    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT id, title, text FROM $table");

    return List.generate(
      maps.length,
      (i) {
        return Chapter(
          id: maps[i]['id'],
          //chap: maps[i]['chap'],
          title: maps[i]['title'],
          text: maps[i]['text'],
        );
      },
    );
  }
}
