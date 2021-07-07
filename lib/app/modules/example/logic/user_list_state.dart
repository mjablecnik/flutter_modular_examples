import 'package:boilerplate/app/modules/example/data/user.dart';

class UserListState {
  final List<User> users;
  final bool loading;
  final bool error;

  UserListState.initial()
      : users = [],
        error = false,
        loading = false;

  UserListState.loading()
      : users = [],
        error = false,
        loading = true;

  UserListState.success(List<User> this.users)
      : error = false,
        loading = false;

  UserListState.error()
      : users = [],
        error = true,
        loading = false;
}