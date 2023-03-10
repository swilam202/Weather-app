import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  int _version = 1;

  init() async {
    String dateBasePath = await getDatabasesPath();
    String path = join(dateBasePath, 'res.db');
    _db = await openDatabase(path, version: _version,
        onCreate: (_db, _version) async {
      Batch batch = _db.batch();
      batch.execute('''
      CREATE TABLE "cities"(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      city TEXT
      )
    ''');
      await batch.commit();
    });
    return _db;
  }

  queryData(String tableName) async {
    List response = await _db!.query(tableName);
    return response;
  }

  deleteItem(int id, String tableName) async {
    int response =
        await _db!.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return response;
  }

  deleteData(String tableName) async {
    int response = await _db!.delete(tableName);
    return response;
  }

  insertItem(String tableName, Map<String, Object> values) async {
    int response = await _db!.insert(tableName, values);
    return response;
  }
}
