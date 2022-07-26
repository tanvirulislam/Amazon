// ignore_for_file: prefer_const_constructors

import 'package:amazon/screens/search_screen.dart';
import 'package:amazon/utils/colors.dart';
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
        body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 300,
            color: Colors.amber,
            height: 100,
            child: InkWell(
              onTap: () =>  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                ),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Search for something in Amazon',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mic_outlined),
          )
        ],
      ),
        ),
      ),
    );
  }
}
