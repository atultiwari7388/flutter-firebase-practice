import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.onSignOut, required this.auth})
      : super(key: key);
  final AuthBase auth;
  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Home'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.signOutAlt),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
