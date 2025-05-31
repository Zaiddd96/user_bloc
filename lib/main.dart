import 'package:flutter/material.dart';
import 'user-interface/screens/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Manager App',
      theme: ThemeData.light(), //light theme by default
      darkTheme: ThemeData.dark(), // light theme
        themeMode: ThemeMode.system,
      home: const UserListScreen(),
        debugShowCheckedModeBanner: false
    );
  }
}
