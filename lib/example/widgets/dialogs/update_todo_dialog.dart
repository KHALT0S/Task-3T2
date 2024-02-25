import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/example/models/todo_model.dart';
import 'package:todo_app/example/providers/todo_provider.dart';
import 'package:todo_app/example/widgets/todo_input_field.dart';

class UpdateTodoDialog extends StatefulWidget {
  final Todo todo;
  const UpdateTodoDialog({required this.todo, super.key});

  @override
  State<UpdateTodoDialog> createState() => UpdateTodoDialogState();
}

class UpdateTodoDialogState extends State<UpdateTodoDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleEC = TextEditingController();
  final TextEditingController descriptionEC = TextEditingController();

  @override
  void initState() {
    titleEC.text = widget.todo.title;
    descriptionEC.text = widget.todo.description;
    super.initState();
  }

  @override
  void dispose() {
    titleEC.dispose();
    descriptionEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: formKey,
        child: Container(
          height: 400,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Update a Task",
                style: const TextStyle().copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              TodoInputField(
                label: 'Title',
                controller: titleEC,
                maxLines: 1,
                validator: (title) {
                  if (title == null || title.isEmpty) {
                    return "Title shouldn't be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TodoInputField(
                label: 'Description',
                controller: descriptionEC,
                maxLines: 3,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  child: Text(
                    "Update",
                    style: const TextStyle().copyWith(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    if (!formKey.currentState!.validate()) return;
    context.read<TodoProvider>().updateTodo(
          widget.todo,
          title: titleEC.text,
          description: descriptionEC.text,
        );
    Navigator.of(context).pop();
  }
}
