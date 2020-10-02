import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Social Login Demo"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: _handleGoogleSignIn,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FontAwesomeIcons.google,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Google Sign In"),
            ],
          ),
        ),
      )),
    );
  }

  void _handleGoogleSignIn() {}
}
