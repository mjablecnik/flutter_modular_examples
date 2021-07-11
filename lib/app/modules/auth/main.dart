import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'logic/user_list_store.dart';
import 'ui/login_page.dart';
import 'data/user_repository.dart';

class AuthMainWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
     Bind.singleton((i) => UserListStore()),
     Bind.singleton((i) => UserRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => AuthMainWidget()),
  ];

}