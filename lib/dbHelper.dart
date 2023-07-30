import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// atexts geloofbelydenis
// btexts Ecumenical creeds
// ctexts Kategismus
// dtexts Dort

class DBProvider {
  final String _dbName = 'gelb.db'; // change db name to update

   static DBProvider? _dbProvider;
  static Database? _database;

  DBProvider._createInstance();

  factory DBProvider() {
    _dbProvider ??= DBProvider._createInstance();
    return _dbProvider!;
  }

  Future<Database> get database async {
    _database ??= await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _dbName);

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", _dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path);
  }

  Future close() async {
    return _database!.close();
  }
}
