import 'package:flutter/material.dart';
import 'package:todo_app/toDoApp/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoModel> _todoList = [
    TodoModel(
        title: 'Finish GDSC Task 2',
        isCompleted: true,
        isImportant: 1,
        editedDate: DateTime.now()),
    TodoModel(
        title: 'Finish GDSC Task 3',
        isCompleted: false,
        isImportant: 2,
        editedDate: DateTime.now()),
    TodoModel(
        title: 'Follow the GDSC IAU on Linkedin',
        isCompleted: false,
        isImportant: 3,
        editedDate: DateTime.now()),
  ];

  void addTodo({
    required String title,
    String description = '',
    int isImportant = 1,
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
    int? isImportant,
  }) {
    _todoList[_todoList.indexOf(todo)] = todo.updateTodo(
      title: title,
      description: description,
      isCompleted: isCompleted,
      isImportant: isImportant.toString(),
    );
    notifyListeners();
  }

  Color getBoxColor(int isImportant) {
    switch (isImportant) {
      case 1:
        return Colors.green.shade200;
      case 2:
        return Colors.yellow.shade200;
      case 3:
        return Colors.red.shade100;
      default:
        return Colors.white;
    }
  }

  List<TodoModel> get todos => [..._todoList];

  List<TodoModel> get completed =>
      _todoList.where((element) => element.isCompleted).toList();
}
