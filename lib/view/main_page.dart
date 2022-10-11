import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/view/home/home_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('sign in as : ${user!.email}'),
              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => HomeScreen()));
                },
                color: Colors.deepPurple,
                child: const Text(
                  "sign out",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  try {
                    var user = await FirebaseAuth.instance.currentUser;
                  user!.delete().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => HomeScreen(),
                          ),
                        ),
                      );
                  } catch (e) {
                    print(e);
                  }
                },
                color: Colors.red,
                child: const Text(
                  "delete",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
