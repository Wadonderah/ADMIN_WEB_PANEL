import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/main_screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBUtj9AHyAx-mSr95cDaWwaosKIQxXcag8",
          authDomain: "dish-hub-38f51.firebaseapp.com",
          projectId: "dish-hub-38f51",
          storageBucket: "dish-hub-38f51.appspot.com",
          messagingSenderId: "777807923074",
          appId: "1:777807923074:web:b4b8e28fc2778680cef19b"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
