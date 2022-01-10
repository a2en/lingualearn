import 'package:lingualearn/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../base_model.dart';

class HomeViewModel extends BaseModel {
  FirebaseService _firebaseService;

  List<String> languages = ["English"];
  String selectedLanguage = "English";


  HomeViewModel(this._firebaseService){
   fetchLanguages();
  }

  fetchLanguages() async {
    setBusy(true);
    QuerySnapshot snapshot = await _firebaseService.fetchLanguages();
    languages.clear();
    for (var element in snapshot.docs) {
       languages.add(element.get("name"));
    }
    setBusy(false);
  }
}