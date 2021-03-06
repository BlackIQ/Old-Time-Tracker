import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_cource/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_cource/app/sign_in/social_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {

  SignInPage({@required this.onSignIn});
  final Function(FirebaseUser) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(authResult.user);
    }
    catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Sign in to your account'),
        elevation: 10.0,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            SocialSignInButton(
              assetName: 'images/google-logo.png',
              text: 'Sign in with Google',
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {},
            ),
            SizedBox(
              height: 10.0,
            ),
            SocialSignInButton(
              assetName: 'images/facebook-logo.png',
              text: 'Sign in with Facebook',
              color: Colors.indigo,
              textColor: Colors.white,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            SignInButton(
              text: 'Sign in with Email',
              textColor: Colors.white,
              color: Colors.teal,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'or',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              textAlign:TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            SignInButton(
              text: 'Go Anonymous',
              textColor: Colors.black,
              color: Colors.lime,
              onPressed: _signInAnonymously,
            ),
          ],
        ),
    );
  }
}