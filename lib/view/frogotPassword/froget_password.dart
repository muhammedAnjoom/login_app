import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/auth/user_authentication.dart';
import 'package:login_app/view/home/home_screen.dart';

import '../widgets/back_button.dart';
import '../widgets/background_screen.dart';
import '../widgets/customSnackBar.dart';
import '../widgets/heading_text.dart';

class FrogotPassword extends StatelessWidget {
  FrogotPassword({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

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
              padding: const EdgeInsets.only(top: 180, bottom: 190),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: MainHeading(
                        title: "Frogot password?",
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 16,
                              sigmaY: 16,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 20,
                                ),
                                child: Form(
                                  key: fromKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Don't worry! it happens.Please enter the address and check your email.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextFormField(
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 13,
                                            ),
                                            hintText: "Email",
                                            filled: true,
                                            enabledBorder: UnderlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide.none),
                                            fillColor: const Color.fromARGB(
                                                185, 241, 236, 236),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    235, 255, 123, 0),
                                                width: 3,
                                              ),
                                            ),
                                          ),
                                          validator: (email) => email != null &&
                                                  !EmailValidator.validate(
                                                      email)
                                              ? "Enter a valid email"
                                              : null,
                                          textInputAction: TextInputAction.next,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () async{
                                            final email = _emailController.text.trim();
                                            print(email);
                                            await frogotPassword(context);
                                            // ignore: use_build_context_synchronously
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (ctx) => HomeScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25,
                                              vertical: 15,
                                            ),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  235, 255, 123, 0),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Center(
                                                child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

    Future frogotPassword(context) async {
    try {
      final email = _emailController.text.trim();
      if (email != null) {
        
        print("user email $email");
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        const snackBar = SnackBar(
          backgroundColor: Colors.transparent,
          content: CustomSnackBarContent(
            message: "password reset email sent",
            backgroundColor: Color.fromARGB(235, 8, 151, 3),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        print("email null");
      }
    } on FirebaseAuthException catch (e) {
      var snackBar = SnackBar(
        backgroundColor: Colors.transparent,
        content: CustomSnackBarContent(
          message: e.toString(),
          backgroundColor: const Color.fromARGB(235, 196, 21, 8),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
