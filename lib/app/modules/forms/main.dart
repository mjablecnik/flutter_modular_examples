import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'logic/user_list_store.dart';
import 'data/repositories/user_repository.dart';
import 'ui/pages/register_page.dart';

class FormsMainWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms examples',
      theme: ThemeData.light(),
      home: RegisterPage(),
    );
  }
}

class FormsModule extends Module {
  @override
  List<Bind> get binds => [
     Bind.singleton((i) => UserListStore()),
     Bind.singleton((i) => UserRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => FormsMainWidget()),
  ];

}