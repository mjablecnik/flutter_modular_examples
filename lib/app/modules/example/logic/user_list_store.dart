import 'package:boilerplate/app/modules/example/data/user.dart';
import 'package:boilerplate/app/modules/example/data/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class UserListStore extends NotifierStore<Exception, List<User>> {
  final UserRepository repository;

  UserListStore(this.repository) : super([]);

  Future<void> loadUsers() async {
    setLoading(true, force: true);
    try {
      update(await repository.users());
    } catch (error) {
      setError(Exception("Cannot load users."));
    }
    setLoading(false);
  }

  Future<void> addUser(User user) async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 1));
    await repository.addUser(user);
    update([...this.state, user]);
    setLoading(false);
  }

  Future<void> removeUser(User user) async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 1));
    await repository.removeUser(user);
    update([...this.state..remove(user)]);
    setLoading(false);
  }
}
