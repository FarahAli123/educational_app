import 'package:educational_app/login_screen.dart';
import 'package:educational_app/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          
            const Text(
              'Welcome to EduLearn!',
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenSize.height * 0.05), 

            ElevatedButton(
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, 
                padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02), 
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02), 

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent, // Button color
                padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),),
              child: const Text(
             'Sign Up',
                style: TextStyle(fontSize: 18, color: Colors.white), ),
    ),
          ],
        ),
      ),
    );
  }
}
