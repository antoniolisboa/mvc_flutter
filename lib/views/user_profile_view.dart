import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProfileView extends StatelessWidget {
  final User user;

  const UserProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Age: ${user.age}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
