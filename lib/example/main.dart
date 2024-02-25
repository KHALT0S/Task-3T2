import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/example/providers/todo_provider.dart';
import 'package:todo_app/example/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TodoProvider(),
      )
    ],
    child: const ExampleApp(),
  ));
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example App',
      home: const HomeScreen(),
      theme: _getTheme(),
    );
  }

  ThemeData _getTheme() {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
    return ThemeData().copyWith(
      textTheme: GoogleFonts.robotoTextTheme(),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF4CC160),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF4CC160),
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(16),
          border: outlineInputBorder),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CC160),
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
