import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb
import 'splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // For Flutter Web, supply the Firebase configuration options.
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAC4lw9oSn6fHO0NXQ2zyf-HA_AikYMfUc",
        authDomain:
            "com.example.untitled4", // e.g. "your-project.firebaseapp.com"
        projectId: "gemquest-fb895", // e.g. "your-project-id"
        storageBucket:
            "gemquest-fb895.firebasestorage.app", // e.g. "your-project.appspot.com"
        messagingSenderId: "321235046752", // e.g. "1234567890"
        appId:
            "1:321235046752:android:d7dca46e8fa9b5f0720e05", // e.g. "1:1234567890:web:abcdef123456"
      ),
    );
  } else {
    // For mobile platforms, Firebase will pick up configuration from google-services.json
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gem Encyclopedia & Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Show SplashScreen first
    );
  }
}
