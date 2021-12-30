import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/screens/home.screen.dart';
import 'package:flutter_with_firebase/screens/signin.screen.dart';
import 'package:flutter_with_firebase/services/auth.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    // _updateUser(widget.auth.currentUser);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SigninPage(
        auth: widget.auth,
        onSignin: (user) => _updateUser(user),
      );
    }
    return HomeScreen(
      auth: widget.auth,
      onSignOut: () => _updateUser,
    );
  }
}
