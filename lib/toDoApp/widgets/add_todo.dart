// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/toDoApp/providers/todo_provider.dart';

class AddTodos extends StatelessWidget {
  const AddTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Flexible(
                  child: TextField(
                    controller: _titleController,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'name of TODO',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black45.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    String title = _titleController.text.trim();
                    if (title.isNotEmpty) {
                      todoProvider.addTodo(title: title);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 400,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
