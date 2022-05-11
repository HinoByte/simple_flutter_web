import 'dart:async';
import 'package:my_server/models/news.dart';
import 'package:my_server/models/toys.dart';
import 'package:my_server/models/users.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBase {
  Database _database;

  Future<Database> get database async =>
      _database != null ? _database : await initDB();

  Future<Database> initDB() async {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    final Database db =
        await databaseFactory.openDatabase('/home/hino/toys.db');
    return db;
  }

  void insertToy(Toys toy) async {
    final Database dbClient = await database;
    await dbClient.insert(
      'toys',
      toy.toJson(),
    );
  }

  void deleteToy(Toys toy) async {
    final Database dbClient = await database;
    await dbClient.delete(
      'toys',
      where: "idToy = ?",
      whereArgs: [toy.idToy],
    );
  }

  Future<List<Toys>> getAllToys() async {
    final Database dbClient = await database;
    final res = await dbClient.rawQuery('SELECT * FROM toys');
    final List<Toys> list =
        res.isNotEmpty ? res.map((c) => Toys.fromJson(c)).toList() : null;
    return list;
  }

  void insertUser(Users user) async {
    print(user.email);
    final Database dbClient = await database;
    await dbClient.insert(
      'users',
      user.toJson(),
    );
  }

  void deleteUser(Users user) async {
    final Database dbClient = await database;
    await dbClient.delete(
      'users',
      where: "idUser = ?",
      whereArgs: [user.idUser],
    );
  }

  Future<bool> checkPasswordUser(Users user) async {
    final Database dbClient = await database;
    final res = await dbClient.rawQuery('SELECT * FROM users');
    final List<Users> listUsers =
        res.isNotEmpty ? res.map((c) => Users.fromJson(c)).toList() : null;
    return listUsers.every((usersDB) =>
        (usersDB.login == user.login) && (usersDB.password == user.password));
  }

  void insertNews(News news) async {
    final Database dbClient = await database;
    await dbClient.insert(
      'news',
      news.toJson(),
    );
  }

  void deleteNew(News news) async {
    final Database dbClient = await database;
    await dbClient.delete(
      'news',
      where: "idNews = ?",
      whereArgs: [news.idNews],
    );
  }

  Future<List<News>> getAllNews() async {
    final Database dbClient = await database;
    final res = await dbClient.rawQuery('SELECT * FROM news');
    final List<News> list =
        res.isNotEmpty ? res.map((c) => News.fromJson(c)).toList() : null;
    return list;
  }
}
