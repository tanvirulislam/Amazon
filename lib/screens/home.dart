// ignore_for_file: prefer_const_constructors

import 'package:amazon/widgets/search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(child: SearchBar(), preferredSize: Size.fromHeight(80)),
       
      ),
    );
  }
}
