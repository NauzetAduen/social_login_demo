import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'services/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationServiceImpl>(
          create: (_) =>
              AuthenticationServiceImpl(FirebaseAuth.instance, GoogleSignIn()),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationServiceImpl>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        title: 'Social Login Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    // print(firebaseUser);
    if (firebaseUser == null) {
      return LoginPage();
    }
    return HomePage(firebaseUser);
  }
}
