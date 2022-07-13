// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:amazon/screens/home.dart';
import 'package:amazon/screens/sign_up.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/conostant.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/resources/auth_method.dart';
import 'package:amazon/widgets/custome_button.dart';
import 'package:amazon/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthMethod authMethod = AuthMethod();

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
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
                    Card(
                      elevation: 2,
                      child: Container(
                        height: screenSize.height * 0.5,
                        width: screenSize.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Sign In', textScaleFactor: 2),
                              TextFieldWidget(
                                title: 'Email',
                                hintText: 'Enter email',
                                controller: emailController,
                                obscureText: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'plese fill up the name field';
                                  }
                                },
                              ),
                              TextFieldWidget(
                                title: 'Password',
                                hintText: 'Enter password',
                                controller: passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'plese fill up the password field';
                                  }
                                },
                              ),
                              CustomeButton(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.black),
                                ),
                                color: yellowColor,
                                isLooding: true,
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      authMethod.signIn(
                                        context: context,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    );
                                  } else {
                                    print('object');
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: screenSize.width * 0.9,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 1,
                            color: Colors.grey,
                          )),
                          Text('New to Amazon?'),
                          Expanded(
                              child: Container(
                            height: 1,
                            color: Colors.grey,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomeButton(
                      child: Text(
                        'Create an Amazon account',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.grey[300]!,
                      isLooding: true,
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
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
