
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/base_models.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(userModel user) async {
    final db = await database;
    return await db!.insert('users', user.toJson());
  }

  Future<userModel?> getUser(String password, String email) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return userModel.fromJson(maps.first);
    }
    return null;
  }
}
