import 'dart:math';

import '../models/user.dart';

class UserRepository {

  List<User> allUsers = [
    User(1, "Martin", "Jablecnik", "test123", "martin033@email.cz", "637236980"),
    User(2, "Jiri", "Cerny", "test789", "cerny@email.cz", "637 236 980"),
    User(3, "Tomas", "Potocky", "test789", "potocky@gmail.com", "+420 637 236 980")
  ];

  Future<List<User>> users() {
    return Future.delayed(
      Duration(seconds: 2),
          () => this.allUsers
    );
  }

  Future<void> addUser(User user) async {}

  Future<void> removeUser(User user) async {}
}