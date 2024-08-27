import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Post.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'posts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE posts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            location TEXT,
            price REAL
          )
        ''');
      },
    );
  }

  Future<int> insertPost(Post post) async {
    final db = await database;
    return await db.insert('posts', post.toMap());
  }

  Future<List<Post>> getPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('posts');

    return List.generate(maps.length, (i) {
      return Post.fromMap(maps[i]);
    });
  }

  Future<int> deletePost(int id) async {
    final db = await database;
    return await db.delete('posts', where: 'id = ?', whereArgs: [id]);
  }
}
