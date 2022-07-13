// ignore_for_file: prefer_const_constructors

import 'package:amazon/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLooding;
  final VoidCallback onPressed;
  const CustomeButton({
    Key? key,
    required this.child,
    required this.color,
    required this.isLooding,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return ElevatedButton(
      onPressed: onPressed,
      child: isLooding
          ? child
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(color: Colors.white)),
            ),
      style: ElevatedButton.styleFrom(
          primary: color, fixedSize: Size(screenSize.width *0.5, 30)),
    );
  }
}
