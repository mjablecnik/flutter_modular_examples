import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_validator/the_validator.dart';

import '../logic/user_list_store.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, UserListStore> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
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
                validator: FieldValidator.multiple([FieldValidator.minLength(2), FieldValidator.required()]),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Surname",
                  contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                ),
                validator: FieldValidator.multiple([FieldValidator.minLength(2), FieldValidator.required()]),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                ),
                validator: FieldValidator.email(),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                initialValue: "Test123",
                decoration: InputDecoration(
                  labelText: "Password",
                  contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  suffixIcon: Icon(Icons.visibility),
                ),
                validator: FieldValidator.password(
                  minLength: 8,
                  shouldContainNumber: true,
                  shouldContainCapitalLetter: true,
                  shouldContainSmallLetter: true,
                  errorMessage: "Password must have minimal 8 characters",
                  onNumberNotPresent: () => "Password must contain number",
                  onSpecialCharsNotPresent: () => "Password must contain special characters",
                  onCapitalLetterNotPresent: () => "Password must contain capital letters",
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                initialValue: "Test123",
                decoration: InputDecoration(
                  labelText: "Repeat password",
                  contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  suffixIcon: Icon(Icons.visibility),
                ),
                validator: FieldValidator.password(
                  minLength: 8,
                  shouldContainNumber: true,
                  shouldContainCapitalLetter: true,
                  shouldContainSmallLetter: true,
                  errorMessage: "Password must have minimal 8 characters",
                  onNumberNotPresent: () => "Password must contain number",
                  onSpecialCharsNotPresent: () => "Password must contain special characters",
                  onCapitalLetterNotPresent: () => "Password must contain capital letters",
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 46),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    },
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
    );
  }
}
