import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationService {
  Future<User> googleSignIn();
  Future<void> googleSignOut();
  Stream<User> get authStateChanges;
}

class AuthenticationServiceImpl implements AuthenticationService {
  final FirebaseAuth auth;
  final GoogleSignIn signIn;

  AuthenticationServiceImpl(this.auth, this.signIn);

  Future<User> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount = await signIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User user = authResult.user;
    return user;
  }

  Future<void> googleSignOut() async {
    await auth.signOut();
  }

  Stream<User> get authStateChanges => FirebaseAuth.instance.authStateChanges();
}
