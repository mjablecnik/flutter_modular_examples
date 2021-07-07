import 'dart:math';

import 'package:boilerplate/app/modules/example/user.dart';
import 'package:boilerplate/app/modules/example/user_detail_view.dart';
import 'package:boilerplate/app/modules/example/user_list_controller.dart';
import 'package:boilerplate/app/modules/example/user_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserListView extends StatefulWidget {
  final UserListController controller = Modular.get<UserListController>();

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  void initState() {
    widget.controller.loadUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ValueListenableBuilder<UserListState>(
        valueListenable: widget.controller,
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
                onDismissed: (_) => widget.controller.removeUser(user),
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
          widget.controller.addUser(User(Random().nextInt(1000)));
        },
      ),
    );
  }
}