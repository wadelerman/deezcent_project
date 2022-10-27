import 'package:deezcent_project/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:deezcent_project/modules/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  LocalUser? _userFromFirebaseUser(user) {
    if (user != null) {
      return LocalUser(uid: user.uid);
    } else {
      return null;
    }
  }

  // auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
    //.map((FirebaseAuth user) => _userFromFirebaseUser(user));
    // .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      FirebaseAuth user = result.user as FirebaseAuth;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseAuth user = result.user as FirebaseAuth;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register new user
  // Future registerWithEmailAndPassword(String email, String password) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     FirebaseAuth user = result.user as FirebaseAuth;
  //     // create a new document for the user with the uid

  //     await DatabaseService(uid: user.uid)
  //         .updateUserData('first name', 'last name');
  //     return _userFromFirebaseUser(user);
  //   } catch (error) {
  //     print(error.toString());
  //     return null;
  //   }
  // }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
