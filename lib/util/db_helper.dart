import 'dart:async';
import 'dart:io';

import 'package:fluter_sqlite_sample/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  // Singleoton
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();

  // Database properties
  final String tableUsers = 'users';
  final String columnID = 'id';
  final String columnName = 'name';
  final String columnPassword = 'password';

  // Initializing database
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
  }

  initDatabase() async {
    Directory documents = await getApplicationDocumentsDirectory();
    String path = join(documents.path, "db_main.db");

    var innerDatabase =
        await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $tableUsers('
        '$columnID INTEGER PRIMARY KEY,'
        '$columnName TEXT,'
        '$columnPassword TEXT'
        ')');
  }

  /* CRUD */

  // Insert
  Future<int> insertUser(User user) async {
    var database = await db;
    int result = await database.insert(tableUsers, user.toMap());

    return result;
  }

  // Get All Users
  Future<List> getAllUsers() async {
    var database = await db;
    var result = await database.rawQuery('SELECT * FROM $tableUsers');

    return result.toList();
  }

  // Users table lenght
  Future<int> usersLenght() async {
    var database = await db;
    return Sqflite.firstIntValue(
        await database.rawQuery('SELECT COUNT(*) FROM $tableUsers'));
  }

  // Return a user by id
  Future<User> getUserById(int id) async {
    var database = await db;
    var result = await database
        .rawQuery('SELECT * FROM $tableUsers WHERE $columnID = $id');

    if (result.length == 0) return null;

    return User.fromMap(result.first);
  }

  // Delete a specific user
  Future<int> deleteUserById(int id) async {
    var database = await db;
    return await database.delete(
      tableUsers,
      where: '$columnID = ?',
      whereArgs: [id],
    );
  }

  // Updates a specific user
  Future<int> updateUser(User user) async {
    var database = await db;

    return await database.update(
      tableUsers,
      user.toMap(),
      where: '$columnID = ?',
      whereArgs: [user.id],
    );
  }

  Future close() async {
    var database = await db;
    return database.close();
  }
}
