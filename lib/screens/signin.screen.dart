import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/Widgets/custom_btn.widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key, required this.onSignin}) : super(key: key);

  final void Function(User) onSignin;

  //signin anonymously

  Future<void> _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      onSignin(userCredentials.user!);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          CustomBtn(
            btnName: 'Sign in with Google',
            icon: (FontAwesomeIcons.google),
            color: Colors.red,
            onPressed: () {},
            primaryColor: Colors.blue,
            textColor: Colors.white,
          ),
          SizedBox(height: 8.0),
          CustomBtn(
            btnName: 'Sign in with Facebook',
            icon: (FontAwesomeIcons.facebookF),
            color: Colors.blue,
            onPressed: () {},
            primaryColor: Colors.white,
            textColor: Colors.black,
          ),
          SizedBox(height: 8.0),
          CustomBtn(
            btnName: 'Sign in with Email',
            icon: (FontAwesomeIcons.mailchimp),
            color: Colors.white,
            onPressed: () {},
            primaryColor: Colors.blue,
            textColor: Colors.white,
          ),
          SizedBox(height: 8.0),
          Text(
            "Or",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8.0),
          CustomBtn(
            btnName: 'Go anonymus',
            icon: (FontAwesomeIcons.user),
            color: Colors.white,
            onPressed: _signInAnonymously,
            primaryColor: Colors.blue,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
