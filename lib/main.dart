import 'package:flutter/material.dart';
import 'login_screen.dart'; // Use the login screen as the initial page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gem Encyclopedia & Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Initial screen is now the login page
    );
  }
}
