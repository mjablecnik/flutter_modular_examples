import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

import '../../utils.dart';

class Address extends Equatable {
  final String street;
  final String district;
  final String city;
  final String county;
  final String postalCode;
  final String country;

  Address(this.street, this.district, this.city, this.county, this.postalCode, this.country);

  @override
  List<Object?> get props => [street, district, city, county, postalCode, country];

  @override
  bool get stringify => true;
}

class Profile extends Equatable {
  final FileImage? avatar = null;
  final DateTime? birthday = null;
  final Gender? gender = null;
  final String? favoriteColor = null;
  final File? file = null;
  final String? cardNumber = null;

  @override
  List<Object?> get props => [avatar, birthday, gender, favoriteColor, file, cardNumber];

  @override
  bool get stringify => true;
}

class User extends Equatable {
  final int? id;
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  final String phone;
  final Address? address;
  final Profile? profile;

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
  List<Object?> get props => [id, firstName, lastName, password, email, phone, address, profile];

  @override
  bool get stringify => true;
}
