// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  var validator;
  TextFieldWidget({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.validator,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
    
        ),
        SizedBox(height: 8,),
        TextFormField(
           
            validator: widget.validator,
            obscureText: widget.obscureText,
            controller: widget.controller,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 1,
                ),
              ),
            ),
          ),
    
      ],
    );
  }
}
