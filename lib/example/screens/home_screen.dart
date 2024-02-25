import 'package:flutter/material.dart';
import 'package:todo_app/example/widgets/dialogs/create_todo_dialog.dart';
import 'package:todo_app/example/widgets/summary_widget.dart';
import 'package:todo_app/example/widgets/todo_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const CreateTodoDialog(),
          );
        },
        tooltip: 'Create a task',
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              _buildDayView(),
              const SizedBox(height: 15),
              const TodoSummary(),
              const SizedBox(height: 15),
              const TodoList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          dayFormatter.format(DateTime.now()),
          style: const TextStyle()
              .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        Text(
          ', ${dateFormatter.format(DateTime.now())}',
          style: const TextStyle().copyWith(fontSize: 24),
        )
      ],
    );
  }
}
