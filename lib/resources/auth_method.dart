// ignore_for_file: prefer_const_constructors

import 'package:amazon/resources/cloud_firestore_method.dart';
import 'package:amazon/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethod {
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  Future<String> signUp({
    required BuildContext context,
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    // to remove space from input text
    name.trim();
    address.trim();
    email.trim();
    password.trim();

    String output = 'Something is wrong';

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      cloudFirestoreClass.uploadUserData(userName: name, userAddress: address);
      final snackBar = SnackBar(
        content: Text(
          'Successfully Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: yellowColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(
          e.message.toString(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: yellowColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return output;
  }

// Sign In------------------------------------------
  Future<String> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // to remove space from input text
    // email.trim();
    // password.trim();

    String output = 'Something is wrong';

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final snackBar = SnackBar(
        content: Text(
          'Successfully Sign In',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: yellowColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(
          e.message.toString(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: yellowColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return output;
  }
}
