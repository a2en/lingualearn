import 'package:lingualearn/services/firebase_service.dart';

import '../base_model.dart';

class LoginViewModel extends BaseModel {
  FirebaseService _firebaseService;


  LoginViewModel(this._firebaseService);

  Future<bool> signInWithGoogle() async {
    setBusy(true);
    var success = await _firebaseService.signInWithGoogle();
    setBusy(false);
    return success;
  }


}