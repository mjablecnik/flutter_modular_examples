import 'dart:io';

import 'package:flutter/widgets.dart';

import '../../utils.dart';

class Address {
  final String street;
  final String district;
  final String city;
  final String county;
  final String postalCode;
  final String country;

  Address(this.street, this.district, this.city, this.county, this.postalCode, this.country);
}

class Profile {
  FileImage? avatar;
  DateTime? birthday;
  Gender? gender;
  String? favoriteColor;
  File? file;
  String? cardNumber;
}

class User {
  final int? id;
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final String phone;
  Address? address;
  Profile? profile;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.password,
    this.email,
    this.phone, {
    this.address,
    this.profile,
  });

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
