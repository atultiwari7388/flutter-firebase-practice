import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  // User get currentUser;
  Future<User?> signInAnonymous();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  //currentUser: User;
  @override
  // User get currentUser => _firebaseAuth.currentUser!;

  //signin anonymosly
  @override
  Future<User?> signInAnonymous() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  //signout
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
