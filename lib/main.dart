import 'package:flutter/material.dart';
// import './example/main.dart' as example;

void main() {
  // example.main();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Scaffold(
        body: Center(
          child: Text(
            "Hello World",
            style: const TextStyle().copyWith(
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
