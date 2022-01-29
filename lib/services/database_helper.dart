import 'package:new_app/models/task_model.dart';
import 'package:new_app/models/todo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  _initDatabase() async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        'todo.db',
      ),
      onCreate: (db, version) => _onCreate(db, version),
      version: 1,
    );
  }

  Future<Database> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
    await db.execute(
        "CREATE TABLE todo(id INTEGER PRIMARY KEY, taskId INTEGER, text TEXT, isDone INTEGER)");

    return db;
  }

  Future<void> insertTask(Task task) async {
    Database db = await _initDatabase();
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertTodo(Todo todo) async {
    Database db = await _initDatabase();
    await db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> getTasks() async {
    Database db = await _initDatabase();
    List<Map<String, dynamic>> taskMap = await db.query('tasks');
    return List.generate(taskMap.length, (index) {
      return Task(
          id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          description: taskMap[index]['description']);
    });
  }
}
