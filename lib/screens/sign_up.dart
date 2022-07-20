// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:amazon/layouts/screen_layout.dart';
import 'package:amazon/screens/home.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/conostant.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/resources/auth_method.dart';
import 'package:amazon/widgets/custome_button.dart';
import 'package:amazon/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    nameController.dispose();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  AuthMethod authMethod = AuthMethod();

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      amazonLogo,
                      height: screenSize.height / 10,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.7,
                      child: Card(
                        elevation: 2,
                        child: Container(
                          height: screenSize.height,
                          width: screenSize.width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Sign Up', textScaleFactor: 2),
                                TextFieldWidget(
                                  title: 'Name',
                                  hintText: 'Enter Name',
                                  controller: nameController,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'plese fill up the name field';
                                    }
                                  },
                                ),
                                TextFieldWidget(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'plese fill up the address field';
                                    }
                                  },
                                  title: 'Address',
                                  hintText: 'Enter address',
                                  controller: addressController,
                                  obscureText: false,
                                ),
                                TextFieldWidget(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'plese fill up the email field';
                                    }
                                  },
                                  title: 'Email',
                                  hintText: 'Enter email',
                                  controller: emailController,
                                  obscureText: false,
                                ),
                                TextFieldWidget(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'plese fill up the password field';
                                    }
                                  },
                                  title: 'Password',
                                  hintText: 'Enter password',
                                  controller: passwordController,
                                  obscureText: true,
                                ),
                                CustomeButton(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  color: yellowColor,
                                  isLooding: true,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await authMethod.signUp(
                                        name: nameController.text,
                                        address: addressController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context,
                                      );
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenLayout(),));
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomeButton(
                      child: Text(
                        'Back',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.grey[300]!,
                      isLooding: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
