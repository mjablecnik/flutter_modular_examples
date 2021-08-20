import 'package:the_validator/the_validator.dart';
import 'package:flutter/material.dart';

FormFieldValidator<String> passwordFieldValidator = FieldValidator.password(
  minLength: 8,
  shouldContainNumber: true,
  shouldContainCapitalLetter: true,
  shouldContainSmallLetter: true,
  errorMessage: "Password must have minimal 8 characters",
  onNumberNotPresent: () => "Password must contain number",
  onSpecialCharsNotPresent: () => "Password must contain special characters",
  onCapitalLetterNotPresent: () => "Password must contain capital letters",
);

enum Gender { male, female, other }