import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDBjtB8fa4GBICMWw3my1_9zqYTlZHRv6I",
            authDomain: "task-28b79.firebaseapp.com",
            projectId: "task-28b79",
            storageBucket: "task-28b79.appspot.com",
            messagingSenderId: "70929362700",
            appId: "1:70929362700:web:0c459929f2b8ae87912329"));
  } else {
    await Firebase.initializeApp();
  }
}
