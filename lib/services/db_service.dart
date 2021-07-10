import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  static const String dbName = 'todo-app.db';
  static const String tableName = 'list';

  static Future<Database> createDb() async {
    // Get database path
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    // Open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT, description TEXT)');
    });

    return database;
  }

  static void createRecord(
      Database database, String title, String description) async {
    await database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO $tableName(title, description) VALUES(?, ?)',
          [title, description]);
      print('inserted1: $id');
    });
  }

  static void deleteRecord(Database database, int id) async {
    int count =
        await database.rawDelete('DELETE FROM $tableName WHERE id = ?', [id]);
    if (count == 1) {
      // Record deleted
      print("The record has been deleted");
    } else {
      // Record not deleted
      print("An error occured while deleting the record");
    }
  }

  static Future<List<Map>> getRecords(Database database) async {
    List<Map> list = await database.query(
      tableName,
      columns: ['id', 'title', 'description'],
    );
    return list;
  }
}
