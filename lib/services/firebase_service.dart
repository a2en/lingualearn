import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth_service.dart';

class FirebaseService{
  Authentication _auth;

  FirebaseService(this._auth);

  Future<bool> signInWithGoogle() async{
    return _auth.signInWithGoogle();
  }

  Future<QuerySnapshot> fetchLanguages(){
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference languages = firestore.collection('languages');
    return languages.get();
  }

}