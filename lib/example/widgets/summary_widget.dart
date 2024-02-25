import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/example/providers/todo_provider.dart';
import 'package:todo_app/example/widgets/detail_box_widget.dart';

final dayFormatter = DateFormat('EEEE');
final dateFormatter = DateFormat('dd MMM');

class TodoSummary extends StatelessWidget {
  const TodoSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailBox(
          title: "Created tasks",
          counter: todoProvider.todos.length,
        ),
        DetailBox(
          title: "Completed tasks",
          counter: todoProvider.completed.length,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ],
    );
  }
}
