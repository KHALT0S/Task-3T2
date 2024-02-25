import 'package:flutter/material.dart';
import 'package:todo_app/example/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final _todoList = [
    const Todo(title: 'Finish GDSC Task 2', isCompleted: true),
    const Todo(title: 'Finish GDSC Task 3', isCompleted: false),
    const Todo(title: 'Follow the GDSC IAU on Linkedin', isCompleted: false),
  ];

  void addTodo({
    required String title,
    String description = '',
  }) {
    _todoList.add(Todo(title: title, description: description));
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todoList.remove(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo,
      {String? title, String? description, bool? isCompleted}) {
    _todoList[_todoList.indexOf(todo)] = todo.copyWith(
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
    notifyListeners();
  }

  List<Todo> get todos => [..._todoList];

  List<Todo> get completed =>
      _todoList.where((element) => element.isCompleted).toList();
}
