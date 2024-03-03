import 'package:flutter/material.dart';
import 'package:todo_app/toDoApp/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoModel> _todoList = [
    TodoModel(
        title: 'Finish GDSC Task 2',
        isCompleted: true,
        editedDate: DateTime.now()),
    TodoModel(
        title: 'Finish GDSC Task 3',
        isCompleted: false,
        editedDate: DateTime.now()),
    TodoModel(
        title: 'Follow the GDSC IAU on Linkedin',
        isCompleted: false,
        editedDate: DateTime.now()),
  ];

  void addTodo({
    required String title,
    String description = '',
    String isImportant = 'normal',
  }) {
    _todoList.add(TodoModel(
      title: title,
      description: description,
      isImportant: isImportant,
      editedDate: DateTime.now(),
    ));
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todoList.remove(todo);
    notifyListeners();
  }

  void updateTodo(
    TodoModel todo, {
    String? title,
    String? description,
    bool? isCompleted,
    String? isImportant,
  }) {
    _todoList[_todoList.indexOf(todo)] = todo.updateTodo(
      title: title,
      description: description,
      isCompleted: isCompleted,
      isImportant: isImportant,
    );
    notifyListeners();
  }

  List<TodoModel> get todos => [..._todoList];

  List<TodoModel> get completed =>
      _todoList.where((element) => element.isCompleted).toList();
}
