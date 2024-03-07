// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/toDoApp/widgets/todos_box.dart';
import 'package:todo_app/toDoApp/widgets/add_todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 70, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TODOs',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(0),
                        icon: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800.withOpacity(.8),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.sort, color: Colors.white)))
                  ],
                ),
                SizedBox(height: 20),
                const TodoBox()
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => const addTodos()),
          );
        },
        backgroundColor: Colors.grey,
        elevation: 10,
        child: Icon(Icons.add, size: 38),
      ),
    );
  }
}
