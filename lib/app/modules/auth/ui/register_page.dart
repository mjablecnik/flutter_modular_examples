import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_validator/the_validator.dart';

import '../data/models/user.dart';
import '../logic/user_list_store.dart';
import '../utils.dart';

class RegisterForm {
  final key = GlobalKey<FormState>();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordRepeat = TextEditingController();

  User createUser() {
    return User(null, firstName.text, lastName.text, email.text, password.text);
  }

  VoidCallback getSubmit(BuildContext context, UserListStore userListStore) {
    return () {
      if (this.key.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Processing Data'),
          ),
        );
        User user = this.createUser();
        userListStore.addUser(user);
      }
    };
  }
}

class RegisterPage extends StatelessWidget {
  final _form = RegisterForm();
  final _userListStore = Modular.get<UserListStore>();

  FormFieldValidator<String> getPasswordValidator({bool isRepeated: false}) {
    return (fieldValue) {
      var result = passwordFieldValidator(fieldValue);
      bool isSame = _form.password.text == _form.passwordRepeat.text;
      return result == null && !isSame ? "Passwords are not same" : result;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Form(
            key: _form.key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Spacer(),
                  Center(
                    child: Text(
                      "Register",
                      style: GoogleFonts.cookie(fontSize: 80.0),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    controller: _form.firstName,
                    validator: FieldValidator.multiple([FieldValidator.minLength(2), FieldValidator.required()]),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Surname",
                      contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    controller: _form.lastName,
                    validator: FieldValidator.multiple([FieldValidator.minLength(2), FieldValidator.required()]),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    ),
                    controller: _form.email,
                    validator: FieldValidator.email(),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    controller: _form.password,
                    validator: this.getPasswordValidator(),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Repeat password",
                      contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    controller: _form.passwordRepeat,
                    validator: this.getPasswordValidator(isRepeated: true),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 46),
                        ),
                        onPressed: _form.getSubmit(context, _userListStore),
                        child: Text('Create account'),
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () => print("TODO: Go to login page."),
                          child: Text("Login!"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
