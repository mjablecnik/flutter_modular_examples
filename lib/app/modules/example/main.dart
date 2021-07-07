import 'package:boilerplate/app/modules/example/user_list_controller.dart';
import 'package:boilerplate/app/modules/example/user_list_view.dart';
import 'package:boilerplate/app/modules/example/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExampleMainWidget extends StatelessWidget {
  final UserListController controller = Modular.get<UserListController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      home: UserListView(),
    );
  }
}

class ExampleModule extends Module {
  @override
  List<Bind> get binds => [
     Bind.singleton((i) => UserListController()),
     Bind.singleton((i) => UserRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => ExampleMainWidget()),
  ];

}