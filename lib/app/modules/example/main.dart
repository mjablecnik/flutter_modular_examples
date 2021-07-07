import 'package:boilerplate/app/modules/example/logic/user_list_store.dart';
import 'package:boilerplate/app/modules/example/ui/user_list_page.dart';
import 'package:boilerplate/app/modules/example/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExampleMainWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      home: UserListPage(),
    );
  }
}

class ExampleModule extends Module {
  @override
  List<Bind> get binds => [
     Bind.singleton((i) => UserListStore()),
     Bind.singleton((i) => UserRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => ExampleMainWidget()),
  ];

}