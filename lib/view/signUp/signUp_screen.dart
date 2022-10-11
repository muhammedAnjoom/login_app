import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login_app/view/login/login_screen.dart';
import 'package:login_app/view/signUp/signup_card.dart';

import '../widgets/back_button.dart';
import '../widgets/background_screen.dart';
import '../widgets/heading_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundScreen(),
            const BackButtonWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: MainHeading(
                      title: "Sign up",
                    ),
                  ),
                  SignUpCard()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


