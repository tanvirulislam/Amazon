// ignore_for_file: prefer_const_constructors

import 'package:amazon/screens/search_screen.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Size screensize = Utils().getScreenSize();

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(),
          ),
        );
      },
      child: Container(
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
              child: Container(
                height: 60,
                width: screenSize.width * .7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Search for something in Amazon'),
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
    );
  }
}
