import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockUser extends Mock implements User {}

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final MockGoogleSignIn mockGoogleSignIn = MockGoogleSignIn();
  setUp(() {});
  tearDown(() {});

  test('Sign in', () async {
    //
    when(mockGoogleSignIn.signIn()).thenAnswer((_) async => null);
    when(mockFirebaseAuth.currentUser).thenAnswer((_) => null);
  });

  test('Sign Out', () async {
    //
    when(mockFirebaseAuth.signOut()).thenAnswer((_) async => null);
    when(mockFirebaseAuth.currentUser).thenAnswer((_) => null);

    await mockFirebaseAuth.signOut();
    expect(mockFirebaseAuth.currentUser, null);
  });
}
