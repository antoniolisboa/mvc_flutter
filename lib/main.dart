import 'package:flutter/material.dart';
import 'models/user.dart';
import 'controllers/user_profile_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User user = User(name: 'Antonio', age: 24);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVC in Flutter',
      home: UserProfileController(user: user),
    );
  }
}
