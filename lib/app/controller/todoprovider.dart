import 'package:flutter/material.dart';

class Todo {
  String title;
  bool isDone;

  Todo({required this.title, this.isDone = false});
}

class TodoProvider extends ChangeNotifier {
  List<Todo> tasks = [];

  /// ➕ Add
  void addTask(String title) {
    if (title.trim().isEmpty) return;
    tasks.add(Todo(title: title));
    notifyListeners();
  }

  /// ❌ Delete single
  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

 
  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }

  void editTask(int index, String newTitle) {
    if (newTitle.trim().isEmpty) return;
    tasks[index].title = newTitle;
    notifyListeners();
  }


  void clearCompleted() {
    tasks.removeWhere((task) => task.isDone);
    notifyListeners();
  }


  void deleteAll() {
    tasks.clear();
    notifyListeners();
  }

  List<Todo> get pendingTasks =>
      tasks.where((task) => !task.isDone).toList();

  List<Todo> get completedTasks =>
      tasks.where((task) => task.isDone).toList();
}