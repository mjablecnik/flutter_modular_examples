import 'dart:math';

import 'package:boilerplate/app/modules/example/data/user.dart';
import 'package:boilerplate/app/modules/example/ui/user_detail_view.dart';
import 'package:boilerplate/app/modules/example/logic/user_list_controller.dart';
import 'package:boilerplate/app/modules/example/logic/user_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserListView extends StatefulWidget {

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends ModularState<UserListView, UserListController> {
  @override
  void initState() {
    controller.loadUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ValueListenableBuilder<UserListState>(
        valueListenable: controller,
        builder: (context, model, _) {
          if (model.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (model.error) {
            return Center(child: Text('Oh no! Could not load the users'));
          }

          return ListView.builder(
            itemCount: model.users.length,
            itemBuilder: (context, index) {
              var user = model.users[index];

              return Dismissible(
                key: ObjectKey(user),
                onDismissed: (_) => controller.removeUser(user),
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text('User #${user.id}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailsView(user: user),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.addUser(User(Random().nextInt(1000)));
        },
      ),
    );
  }
}