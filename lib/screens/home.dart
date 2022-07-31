// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:amazon/screens/search_screen.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/widgets/banner_add.dart';
import 'package:amazon/widgets/categories_list_view.dart';
import 'package:amazon/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: SearchBar(),
          preferredSize: Size.fromHeight(80),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CategoryListView(),
              BannerAdd(),
            ],
          ),
        ),
      ),
    );
  }
}
