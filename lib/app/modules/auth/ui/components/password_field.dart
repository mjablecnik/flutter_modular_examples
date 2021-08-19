import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  PasswordFormField({
    Key? key,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
  })  : _controller = controller,
        _validator = validator,
        super(key: key);

  final TextEditingController? _controller;
  final FormFieldValidator<String>? _validator;

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enableSuggestions: false,
        autocorrect: false,
        obscureText: _isHidden,
        decoration: InputDecoration(
          labelText: "Password",
          contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
          suffixIcon: GestureDetector(
            onTap: () async {
              await Future.delayed(const Duration(milliseconds: 1));
              FocusScope.of(context).unfocus();
              setState(() {
                _isHidden = !_isHidden;
              });
            },
            child: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        controller: widget._controller,
        validator: widget._validator,
      ),
    );
  }
}
