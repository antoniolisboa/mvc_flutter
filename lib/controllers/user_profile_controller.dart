import 'package:flutter/material.dart';
import '../models/user.dart';
import '../views/user_profile_view.dart';

class UserProfileController extends StatefulWidget {
  final User user;

  const UserProfileController({super.key, required this.user});

  @override
  State<UserProfileController> createState() => _UserProfileControllerState();
}

class _UserProfileControllerState extends State<UserProfileController> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return UserProfileView(user: _user);
  }
}

