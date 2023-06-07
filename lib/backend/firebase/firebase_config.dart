import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAJJFZjDfV0uXSIzp3iaXPr19nNNc0oSvg",
            authDomain: "non-solo-191b2.firebaseapp.com",
            projectId: "non-solo-191b2",
            storageBucket: "non-solo-191b2.appspot.com",
            messagingSenderId: "953807397922",
            appId: "1:953807397922:web:40d248df45c99b7528967b"));
  } else {
    await Firebase.initializeApp();
  }
}
