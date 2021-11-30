import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';

class FirebaseService{
  Authentication _auth;

  FirebaseService(this._auth);

  Future<bool> signInWithGoogle() async{
    return _auth.signInWithGoogle();
  }

}