// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:amazon/screens/home.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPge = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            controller: pageController,
            children: [
              Home(),
              Center(
                child: Text('Account screen'),
              ),
              Center(
                child: Text('cart screen'),
              ),
              Center(
                child: Text('profile screen'),
              ),
            ],
          ),
          bottomNavigationBar: TabBar(
              onTap: (page) {
                pageController.jumpToPage(page);
                setState(() {
                  currentPge = page;
                });
              },
              tabs: [
                Tab(
                  child: Icon(
                    currentPge == 0 ? Icons.home : Icons.home_outlined,
                    color: currentPge == 0 ? Colors.lightBlue : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    currentPge == 1
                        ? Icons.account_circle
                        : Icons.account_circle_outlined,
                    color: currentPge == 1 ? Colors.lightBlue : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    currentPge == 2
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                    color: currentPge == 2 ? Colors.lightBlue : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(
                    currentPge == 3 ? Icons.menu : Icons.menu_outlined,
                    color: currentPge == 3 ? Colors.lightBlue : Colors.black,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
