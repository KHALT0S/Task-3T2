// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/toDoApp/providers/todo_provider.dart';
import 'package:todo_app/toDoApp/models/todo_model.dart';

class TodoBox extends StatelessWidget {
  const TodoBox({Key? key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: todoProvider.todos.length,
        itemBuilder: (context, index) {
          final todo = todoProvider.todos[index];
          final boxColor = todoProvider.getBoxColor(todo.isImportant);
          return Card(
            color: boxColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Checkbox(
                value: todo.isCompleted,
                onChanged: (bool? value) {
                  todoProvider.updateTodo(todo, isCompleted: value);
                },
              ),
              title: RichText(
                text: TextSpan(
                  text: '${todo.title} \n',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: todo.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Edited: ${todo.editedDate}',
                  style: TextStyle(
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  todoProvider.removeTodo(todo);
                },
                icon: Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
