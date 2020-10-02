import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_login_demo/services/authentication_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final User firebaseUser;

  const HomePage(this.firebaseUser);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Username: ${firebaseUser.displayName}"),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlineButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () => _handleGoogleSignOut(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.signOutAlt,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Log Out"),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _handleGoogleSignOut(BuildContext context) async {
    context.read<AuthenticationService>().googleSignOut();
  }
}
