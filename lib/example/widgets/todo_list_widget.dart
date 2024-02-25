import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/example/providers/todo_provider.dart';
import 'package:todo_app/example/widgets/todo_view_widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
    final todoList = todoProvider.todos;
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final todo = todoList[index];
        return TodoView(todo: todo);
      },
      itemCount: todoList.length,
    );
  }
}
