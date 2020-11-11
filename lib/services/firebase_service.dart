import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  FirebaseService.Initial() {
    final Future<FirebaseApp> _initialzation = Firebase.initializeApp();
  }
}
