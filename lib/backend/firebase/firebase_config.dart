import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBrVHDxQpQHhyFfqakd_vzSYagq5621xa4",
            authDomain: "hair-by-heidi-ztq026.firebaseapp.com",
            projectId: "hair-by-heidi-ztq026",
            storageBucket: "hair-by-heidi-ztq026.appspot.com",
            messagingSenderId: "223137784212",
            appId: "1:223137784212:web:f675b9a9c1f92087c92f81"));
  } else {
    await Firebase.initializeApp();
  }
}
