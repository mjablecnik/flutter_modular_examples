import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_validator/the_validator.dart';

import '../logic/user_list_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, UserListStore> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.cookie(fontSize: 80.0),
                    ),
                  ),
                  SizedBox(height: 24.0),
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
                  Expanded(
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () => print("TODO: Go to forgot password page."),
                          child: Text("Forgot password?"),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                              }
                            },
                            child: Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () => print("TODO: Go to register page."),
                          child: Text("Register!"),
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
