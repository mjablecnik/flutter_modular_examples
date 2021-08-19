class User {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  User(this.id, this.firstName, this.lastName, this.email, this.password);

  @override
  String toString() {
    return "User( "
        "Name: ${this.firstName}; "
        "Surname: ${this.lastName}; "
        "Email: ${this.email}; "
        "Password: ${this.password}; "
        ")";
  }
}