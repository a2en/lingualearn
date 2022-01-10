import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lingualearn/ui/widgets/toast.dart';

class Authentication {
  final StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? appUser;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        appUser = userCredential.user;
        _userController.add(userCredential.user!);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          showToast("The account already exists with a different credential");
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          showToast("Error occurred while accessing credentials. Try again.");
        }
      } catch (e) {
        // handle the error here
        showToast("Error occurred using Google Sign In. Try again.");
      }
    }
    return appUser != null;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      showToast("An error occurred while signing out");
    }
  }

  Future<bool> isLoggedIn() async {
    await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userController.add(user);
    }
    return user != null;
  }
}
