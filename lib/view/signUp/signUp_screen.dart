import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_app/view/login/login_screen.dart';

import '../back_button.dart';
import '../background_screen.dart';
import '../heading_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _eamilController = TextEditingController();
  final _passwordControler = TextEditingController();

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
                      title: "Sign up",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 16,
                          sigmaY: 16,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Looks like you don't have an account. Let's create a new ac.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    controller: _eamilController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 13,
                                      ),
                                      hintText: "Email",
                                      border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(235, 255, 123, 0),
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    controller: _passwordControler,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 13,
                                      ),
                                      hintText: "password",
                                      border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                235, 255, 123, 0),
                                            width: 3,
                                          )),
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          // _secureText = !_secureText;
                                        },
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    obscuringCharacter: '●',
                                    obscureText: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "By selecting Agree and continue below,",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "I agree to ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.4,
                                      ),
                                    ),
                                    Text(
                                      "Terms of Service and Privacy Policy",
                                      style: TextStyle(
                                        color: Color.fromARGB(235, 255, 123, 0),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.4,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => LoginScreen(),
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
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      "Agree and continue",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                ),
                              ],
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
