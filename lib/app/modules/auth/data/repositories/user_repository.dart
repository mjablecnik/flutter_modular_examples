import 'dart:math';

import '../models/user.dart';

class UserRepository {

  List<User> allUsers = [
    User(1, "Martin", "Jablecnik", "martin033@email.cz", "test123"),
    User(2, "Iveta", "Jablecnikova", "iveta@email.cz", "test789"),
    User(3, "Tomas", "Potocky", "potocky@gmail.com", "test789")
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