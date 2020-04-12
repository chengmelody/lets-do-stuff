import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:do_it_app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskData extends ChangeNotifier{
  Database taskDB;

  List<Task> _tasks = [];

  TaskData() {
    setup();
  }

  void setup() async {
    await setupDB();
    await loadTasks();
    notifyListeners();
  }

  void setupDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'taskslist.db');

    this.taskDB = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER)');
        });

    print(this.taskDB);
  }

  Future<int> insertTaskIntoDB(Task t) async {
    int id = 0;
    int isDoneInt = t.isDone ? 1 : 0;

    String sql = 'INSERT INTO Tasks(name, isDone) VALUES("${t.name}", $isDoneInt)';

    await this.taskDB.transaction((txn) async {
      id = await txn.rawInsert(
          sql);
    });

    return id;
  }

  void loadTasks() async {
    List<Map> list = await this.taskDB.rawQuery('SELECT * FROM Tasks');
    list.forEach((f) => (
        _tasks.add(Task(id: f['id'], name: f['name'], isDone: f['isDone'] == 1 ? true : false)))
    );
  }

  void removeTaskDB(Task t) async {
    await this.taskDB
        .rawDelete('DELETE FROM Tasks WHERE id = ${t.id}');
  }

  void updateTaskDB(Task t) async {
    int isDoneInt = t.isDone ? 1 : 0;

    await this.taskDB.rawUpdate(
        'UPDATE Tasks SET isDone = ? WHERE id = ?',
        ['$isDoneInt', '${t.id}']);
  }


  UnmodifiableListView get tasks{
    return UnmodifiableListView(_tasks);
  }

  void updateTaskList(String newTask) async{
    Task temp = Task(id: 0, name: newTask, isDone: false);
    int id = await insertTaskIntoDB(temp);
    temp.id = id;
    _tasks.add(temp);
    notifyListeners();
  }

  void checkTask(Task task){
    task.toggleDone();
    notifyListeners();
    updateTaskDB(task);
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
    removeTaskDB(task);
  }
}