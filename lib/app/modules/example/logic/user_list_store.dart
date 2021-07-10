import 'package:boilerplate/app/modules/example/data/user.dart';
import 'package:boilerplate/app/modules/example/data/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class UserListStore extends StreamStore<Exception, List<User>> {
  final UserRepository repository = Modular.get<UserRepository>();

  UserListStore() : super([]);

  Future<void> loadUsers() async {
    setLoading(true);

    try {
      update(await repository.users());
    } catch (error) {
      setError(Exception("Cannot load users."));
    }
    setLoading(false);
  }

  Future<void> addUser(User user) async {
    update([...this.state, user]);
    await repository.addUser(user);
  }

  Future<void> removeUser(User user) async {
    update(this.state..remove(user));
    await repository.addUser(user);
  }
}