import 'package:boilerplate/app/modules/example/user.dart';
import 'package:boilerplate/app/modules/example/user_list_state.dart';
import 'package:boilerplate/app/modules/example/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserListController extends ValueNotifier<UserListState> {
  final UserRepository repository = Modular.get<UserRepository>();

  UserListController() : super(UserListState.initial());

  Future<void> loadUsers() async {
    value = UserListState.loading();

    try {
      value = UserListState.success(await repository.users());
    } catch (error) {
      value = UserListState.error();
    }
  }

  Future<void> addUser(User user) async {
    value = UserListState.success([...value.users, user]);
    await repository.addUser(user);
  }

  Future<void> removeUser(User user) async {
    value = UserListState.success(value.users..remove(user));
    await repository.addUser(user);
  }
}