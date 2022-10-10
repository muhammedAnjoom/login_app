import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_app/view/signUp/signUp_screen.dart';

import '../back_button.dart';
import '../background_screen.dart';
import '../heading_text.dart';
import '../login/login_screen.dart';
import 'package:email_validator/email_validator.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
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
                      title: "Hi!",
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
                            height: double.infinity,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                              !EmailValidator.validate(email)
                                          ? "Enter a valid email"
                                          : null,
                                      textInputAction: TextInputAction.next,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        final email = _emailController.text;
                                        final isValidFrom =
                                            fromKey.currentState!.validate();
                                        if (isValidFrom) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (ctx) => LoginScreen(
                                                email: _emailController.text,
                                              ),
                                            ),
                                          );
                                        }
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
                                          "Continue",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Center(
                                        child: Text(
                                          "or",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const LoginPateformWidget(
                                      name: "Facebook",
                                      imagUrl:
                                          "https://www.pngfind.com/pngs/m/616-6169174_sign-in-facebook-new-logo-2019-hd-png.png",
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const LoginPateformWidget(
                                      name: "Google",
                                      imagUrl:
                                          "https://www.tramvietnam.com.au/wp-content/uploads/2021/07/Illustration-of-Google-icon-on-transparent-background-PNG.png",
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const LoginPateformWidget(
                                      name: "Apple",
                                      imagUrl:
                                          "https://static.vecteezy.com/system/resources/previews/002/520/838/original/apple-logo-black-isolated-on-transparent-background-free-vector.jpg",
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Don't have an account? ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            letterSpacing: 0.4,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (ctx) => SignUpScreen(),
                                            ),
                                          ),
                                          child: const Text(
                                            "Sign up",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  235, 255, 123, 0),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.4,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      "Frogot your password?",
                                      style: TextStyle(
                                        color: Color.fromARGB(235, 255, 123, 0),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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

class LoginPateformWidget extends StatelessWidget {
  const LoginPateformWidget({
    super.key,
    required this.imagUrl,
    required this.name,
  });
  final String imagUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 231, 231),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(
                imagUrl,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "Continue With $name",
              style: const TextStyle(
                color: Color.fromARGB(255, 31, 29, 29),
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
