// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/toDoApp/providers/todo_provider.dart';
import 'package:todo_app/toDoApp/models/todo_model.dart';

class addTodos extends StatelessWidget {
  const addTodos({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 70, 16, 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(0),
                  icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(.8),
                          borderRadius: BorderRadius.circular(10)),
                      child:
                          Icon(Icons.arrow_back_ios_new, color: Colors.white)))
            ],
          ),
        ]),
      ),
    );
  }
}
