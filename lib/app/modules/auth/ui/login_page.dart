import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../logic/user_list_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, UserListStore> {
  @override
  void initState() {
    store.loadUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main page'),
      ),
      body: Center(child: Text("Test text")),
    );
  }
}
