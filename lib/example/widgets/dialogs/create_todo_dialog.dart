import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/example/providers/todo_provider.dart';
import 'package:todo_app/example/widgets/todo_input_field.dart';

class CreateTodoDialog extends StatefulWidget {
  const CreateTodoDialog({super.key});

  @override
  State<CreateTodoDialog> createState() => CreateTodoDialogState();
}

class CreateTodoDialogState extends State<CreateTodoDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleEC = TextEditingController();
  final TextEditingController descriptionEC = TextEditingController();

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
                "Create a Task",
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
                    "Create",
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
    context.read<TodoProvider>().addTodo(
          title: titleEC.text,
          description: descriptionEC.text,
        );
    Navigator.of(context).pop();
  }
}
