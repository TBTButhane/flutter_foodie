import 'dart:io';
import 'package:just_see/models/name_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseH {
  static final _databaseName = 'myDataBase.db';
  static final _visonNumber = 1;
  static final _tableName = 'UserNames';
  static final _idColumn = '_id';
  static final _nameColumn = 'names';
  // static final _columnlist = [_idColumn, _nameColumn];

//Firstly create a private constructor
  DatabaseH._privateConstructor();
  static final DatabaseH instance = DatabaseH._privateConstructor();

  static Database? _database;

  //Create a getter to get the database

  Future<Database> get getDatabase async {
    if (_database != null) return _database!;

    _database = await _initiateDatabase();
    return _database!;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path, version: _visonNumber, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print("Creating Database");
    await db.execute('''
    CREATE TABLE $_tableName (
      $_idColumn INTEGER PRIMARY KEY AUTOINCREMENT,

      $_nameColumn TEXT NOT NULL
    )
      ''');
  }

  // //Create database insert method:
  // Future<NameModel> createUser(NameModel nameModel) async {
  //   final db = await instance.getDatabase;
  //   final id = await db.insert(_tableName, nameModel.toJson());
  //   return nameModel.copy(id: id);
  // }

  // //Read from the database: Single User
  // Future<NameModel> readUser(int id) async {
  //   final db = await instance.getDatabase;
  //   final maps = await db.query(_tableName,
  //       columns: _columnlist, where: '$_idColumn = ?', whereArgs: [id]);

  //   if (maps.isNotEmpty) {
  //     return NameModel.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  // //Read from the database: All Users
  // Future<List<NameModel>> readAllUsers() async {
  //   final db = await instance.getDatabase;
  //   final usersList = await db.query(_tableName);

  //   return usersList.map((json) => NameModel.fromJson(json)).toList();
  // }

  // //Update DataBase value
  // Future<int> update(NameModel nameModel) async {
  //   final db = await instance.getDatabase;
  //   return db.update(_tableName, nameModel.toJson(),
  //       where: '$_idColumn = ?', whereArgs: [nameModel.id]);
  // }

  // // delete from the database
  // Future<int> delete(int id) async {
  //   final db = await instance.getDatabase;
  //   return await db
  //       .delete(_tableName, where: '$_idColumn = ?', whereArgs: [id]);
  // }

  static Future<int> inset(NameModel? user) async {
    print("Insert method called");

    return await _database?.insert(_tableName, user!.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace) ??
        1;
  }

  Future<NameModel> readSingleUser(int id) async {
    Database db = await instance.getDatabase;
    final maps = await db.query(_tableName,
        columns: [_idColumn, _nameColumn],
        where: '$_idColumn = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return NameModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
    // return
  }

  static Future<List<Map<String, dynamic>>> quaryAll() async {
    Database db = await instance.getDatabase;
    final results = await db.query(_tableName);

    return results;
  }

  Future<int> update(NameModel user) async {
    Database db = await instance.getDatabase;

    return await db.update(_tableName, user.toJson(),
        where: '$_idColumn = ?', whereArgs: [user.id]);
  }

  delete(NameModel nameModel) async {
    // Database db = await instance.getDatabase;
    var deleting;
    try {
      deleting = await _database!.delete(_tableName,
          where: '$_idColumn = ?', whereArgs: [nameModel.id]);
    } catch (e) {
      print(e.toString());
    }

    print(deleting);

    return deleting;
  }

  Future close() async {
    final db = await instance.getDatabase;

    db.close();
  }
}
