import 'package:flutter/material.dart';
import 'package:todo_app/toDoApp/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoModel> _todoList = [
    const TodoModel(title: 'Finish GDSC Task 2', isCompleted: true),
    const TodoModel(title: 'Finish GDSC Task 3', isCompleted: false),
    const TodoModel(
        title: 'Follow the GDSC IAU on Linkedin', isCompleted: false),
  ];

  void addTodo({
    required String title,
    String description = '',
    String isImportant = 'normal',
  }) {
    _todoList.add(TodoModel(
      title: title,
      description: description,
      isimportant: isImportant,
    ));
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todoList.remove(todo);
    notifyListeners();
  }

  void updateTodo(TodoModel todo,
      {String? title,
      String? description,
      String? isImportant,
      bool? isCompleted}) {
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
