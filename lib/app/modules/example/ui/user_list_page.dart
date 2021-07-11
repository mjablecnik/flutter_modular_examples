import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../data/user.dart';
import '../ui/user_detail_page.dart';
import '../logic/user_list_store.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends ModularState<UserListPage, UserListStore> {
  @override
  void initState() {
    store.loadUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ScopedBuilder(
        store: store,
        onLoading: (context) => Center(child: CircularProgressIndicator()),
        onError: (context, error) => Center(child: Text(error.toString())),
        onState: (BuildContext context, List<User> users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            var user = users[index];

            return Dismissible(
              key: ObjectKey(user),
              onDismissed: (_) => store.removeUser(user),
              background: Container(color: Colors.red),
              child: ListTile(
                title: Text('User #${user.id}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UserDetailsPage(user: user),
                    ),
                  );
                },
              ),
            );
          },
        ),
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
