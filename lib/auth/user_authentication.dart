import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../view/widgets/customSnackBar.dart';
import '../view/main_page.dart';

class UserAuthentication {
  final _googleSignIn = GoogleSignIn();
  Future logIn(context, String email, String password) async {
    final String _email = email;
    final String _password = password;
    try {
      var userAuth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MainPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        const snackBar = SnackBar(
          backgroundColor: Colors.transparent,
          content: CustomSnackBarContent(
            backgroundColor: Colors.red,
            message: "this user does not exist,create new account",
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == "wrong-password") {
        const snackBar = SnackBar(
          backgroundColor: Colors.transparent,
          content: CustomSnackBarContent(
            message: "Wrong password provided for that user.",
            backgroundColor: Color.fromARGB(235, 255, 123, 0),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  Future signUp(context, String email, String passowrd) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passowrd,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MainPage(),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await FirebaseAuth.instance.signInWithCredential(authCredential);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => MainPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
