import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:save_money_app/model/money.dart';

class Providers {
  Providers._();

  static final Providers db = Providers._();
  static Database? _database;
  static final _tableName = "TODO";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TODODB.db");
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    return await db.execute("CREATE TABLE Todo ("
        "id TEXT PRIMARY KEY,"
        "title TEXT,"
        "dueDate TEXT,"
        "note TEXT"
        ")");
  }

  createMoney(Money money) async {
    final db = await database;
    var res = await db.insert(_tableName, money.toMap());
  }

  getAllMoney() async {
    final db = await database;
    var res = await db.query(_tableName);
    List<Money> list =
        res.isNotEmpty ? res.map((e) => Money.fromMap(e)).toList() : [];
    return list;
  }

  updateMoney(Money money) async {
    final db = await database;
    var res = db
      ..update(_tableName, money.toMap(),
          where: "id = ?", whereArgs: [money.id]);
    return res;
  }

  deleteMoney(String id) async {
    final db = await database;
    var res = db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    return res;
  }

  deleteAllTodo() async {
    final db = await database;
    var res = db.delete('id');
    return res;
  }
}
