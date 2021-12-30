import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/screens/home.screen.dart';
import 'package:flutter_with_firebase/screens/signin.screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  void _updateUser(User user) {
    // print("User: $user");
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SigninPage(
        onSignin: (user) => _updateUser(user),
      );
    }
    return HomeScreen(
      onSignOut: () => _updateUser,
    );
  }
}
