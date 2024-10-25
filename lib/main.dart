import 'package:educational_app/welcome_screen.dart';
import 'package:flutter/material.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()  async{

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Educational App",
     theme: ThemeData(
        primarySwatch: Colors.purple, 
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}