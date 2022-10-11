import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/auth/user_authentication.dart';
import 'package:login_app/view/login/login_card.dart';
import 'package:login_app/view/main_page.dart';

import '../widgets/back_button.dart';
import '../widgets/background_screen.dart';
import '../widgets/customSnackBar.dart';
import '../widgets/heading_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable

class LoginScreen extends StatelessWidget {
  final String email;
  LoginScreen({Key? key, required this.email}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundScreen(),
            const BackButtonWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: MainHeading(
                      title: "Log in",
                    ),
                  ),
                  LoginCard(
                    email: email,
                    scaffoldKey: _scaffoldKey.currentContext,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key, required this.email}) : super(key: key);
//   final String email;

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             const BackgroundScreen(),
//             const BackButtonWidget(),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 100),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(
//                       vertical: 20,
//                       horizontal: 30,
//                     ),
//                     child: MainHeading(
//                       title: "Log in",
//                     ),
//                   ),
//                   LoginCard(
//                     widget: widget,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



// "Wrong password provided for that user.",