// ignore_for_file: prefer_const_constructors

import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Size screensize = Utils().getScreenSize();

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: backgroundGradient),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: screenSize.width * .7,
            child: TextField(
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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mic_outlined),
          )
        ],
      ),
    );
  }
}
