import 'dart:async';

import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class CreateDB {
  Database _database;

  Future<Database> get database async =>
      _database != null ? _database : await initDB();

  Future<Database> initDB() async {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    final Database db =
        await databaseFactory.openDatabase('/home/hino/toys.db');

    await db.execute(
      "CREATE TABLE users ("
      "idUser INTEGER PRIMARY KEY,"
      "login TEXT,"
      "email TEXT,"
      "password TEXT,"
      "isAdmin INT"
      ")",
    );

    await db.execute(
      "CREATE TABLE news ("
      "idNews INTEGER PRIMARY KEY,"
      "name TEXT,"
      "discription TEXT,"
      "dataTime TEXT,"
      "idUser INT"
      ")",
    );

    await db.execute(
      "CREATE TABLE toys ("
      "idToy INTEGER PRIMARY KEY,"
      "nameToy TEXT,"
      "discription TEXT,"
      "image TEXT,"
      "type TEXT,"
      "price REAL"
      ")",
    );
    return db;
  }
}
