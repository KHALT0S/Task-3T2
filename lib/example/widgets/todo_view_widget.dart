import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/example/models/todo_model.dart';
import 'package:todo_app/example/providers/todo_provider.dart';
import 'package:todo_app/example/widgets/dialogs/update_todo_dialog.dart';

class TodoView extends StatelessWidget {
  final Todo todo;

  const TodoView({required this.todo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: _buildTitle(),
      trailing: IconButton(
        onPressed: () {
          context.read<TodoProvider>().removeTodo(
                todo,
              );
        },
        icon: const Icon(Icons.delete),
      ),
      leading: _buildCheckbox(context),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => UpdateTodoDialog(
            todo: todo,
          ),
        );
      },
    );
  }

  Text _buildTitle() {
    return Text(
      todo.title,
      style: const TextStyle().copyWith(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationThickness: 2,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          fontSize: 14),
    );
  }

  Transform _buildCheckbox(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        value: todo.isCompleted,
        onChanged: (bool? isCompleted) {
          context
              .read<TodoProvider>()
              .updateTodo(todo, isCompleted: isCompleted);
        },
      ),
    );
  }
}
