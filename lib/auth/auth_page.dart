
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/view/home/home_screen.dart';
import 'package:login_app/view/main_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return MainPage();
          }else{
            return HomeScreen();
          }
        },
      ),
    );
  }
}