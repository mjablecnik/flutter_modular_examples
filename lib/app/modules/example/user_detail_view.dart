import 'package:boilerplate/app/modules/example/user.dart';
import 'package:flutter/material.dart';

class UserDetailsView extends StatelessWidget {
  final User user;

  const UserDetailsView({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Text('User #${user.id}'),
      ),
    );
  }
}