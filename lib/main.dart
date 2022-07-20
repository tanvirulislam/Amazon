// ignore_for_file: prefer_const_constructors

import 'package:amazon/layouts/screen_layout.dart';
import 'package:amazon/screens/home.dart';
import 'package:amazon/screens/sign_in.dart';
import 'package:amazon/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCdQS5pdZLlIUVYIdqGcycgqVboGqXtIvA",
        authDomain: "fir-80b90.firebaseapp.com",
        projectId: "fir-80b90",
        storageBucket: "fir-80b90.appspot.com",
        messagingSenderId: "138709655586",
        appId: "1:138709655586:web:95f4dd8068f56be90aaa7b",
        measurementId: "G-89FE4T4VMJ",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon',
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: ScreenLayout()
      // StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return ScreenLayout();
      //     } else {
      //       return SignIn();
      //     }
      //   },
      // ),
    );
  }
}
