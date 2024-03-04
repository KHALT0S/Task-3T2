import 'package:flutter/material.dart';
import 'package:todo_app/toDoApp/screens/home_screen.dart';
import 'package:todo_app/toDoApp/providers/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: _getTheme(),
      ),
    );
  }

  ThemeData _getTheme() {
    return ThemeData().copyWith();
  }
}
