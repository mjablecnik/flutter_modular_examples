import 'dart:math';

import 'package:boilerplate/app/modules/example/data/user.dart';
import 'package:boilerplate/app/modules/example/ui/user_detail_page.dart';
import 'package:boilerplate/app/modules/example/logic/user_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  var store = Modular.get<UserListStore>();
  @override
  void initState() {
    super.initState();
    store.observer(
      onState: (state) => print(state),
    );
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await store.loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      bottomNavigationBar: ElevatedButton(
        child: Text('Load'),
        onPressed: () {
          store.loadUsers();
        },
      ),
      body: ScopedBuilder(
        store: store,
        onLoading: (context) {
          return Center(child: CircularProgressIndicator());
        },
        onError: (context, error) {
          return Center(child: Text(error.toString()));
        },
        onState: (BuildContext context, List<User> users) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];

              return Dismissible(
                key: ObjectKey(user),
                onDismissed: (_) async => await store.removeUser(user),
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await store.addUser(User(Random().nextInt(1000)));
        },
      ),
    );
  }
}
