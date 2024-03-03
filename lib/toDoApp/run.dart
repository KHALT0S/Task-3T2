import 'package:flutter/material.dart';
import 'package:todo_app/toDoApp/screens/home_screen.dart';
import 'package:todo_app/toDoApp/providers/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TodoProvider(),
      )
    ],
    child: const ToDoApp(),
  ));
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: _getTheme(),
    );
  }

  ThemeData _getTheme() {
    return ThemeData().copyWith();
  }
}
