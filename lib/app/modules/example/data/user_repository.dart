import 'dart:math';

import 'package:boilerplate/app/modules/example/data/user.dart';

class UserRepository {
  Future<List<User>> users() {
    // throw Exception("Test error");
    return Future.delayed(
      Duration(seconds: 2),
          () => List.generate(5, (index) => User(Random().nextInt(1000))),
    );
  }

  Future<void> addUser(User user) async {}

  Future<void> removeUser(User user) async {}
}