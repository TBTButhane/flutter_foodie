import 'dart:async';
import 'dart:io';
import 'package:just_see/models/userData.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class UserDataBase {
  //Step 1: Create a private constructor
  UserDataBase._privateConstructor();

  static final UserDataBase instance = UserDataBase._privateConstructor();

  static Database? _database;

  Future<Database> get getDatabase async {
    if (_database != null) return _database!;
    _database = await _initiateDatabase();

    return _database!;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "UserData.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print("User table created");
    await db.execute('''
      
      CREATE TABLE UserDetails (
        _id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        surname TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        phoneNumber INT NOT NULL
      )
      ''');
  }

  static Future<int> insert(UserDetails? userDetails) async {
    print("Insert method called");
    return await _database?.insert("UserDetails", userDetails!.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace) ??
        1;
  }
}
