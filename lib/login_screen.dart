
import 'package:educational_app/firebase_authservice.dart';
import 'package:educational_app/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  Authservice _authservice = Authservice();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05), 
        child: Form(
          key: _formKey, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Login to EduLearn',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.05), 

              TextFormField(
                controller: emailController, 
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.purple[800]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: _validateEmail, 
              ),
              SizedBox(height: screenSize.height * 0.02), 

              TextFormField(
                controller: passwordController, 
                obscureText: !_isPasswordVisible, 
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.purple[800]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.purple[800],
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; 
                      });
                    },
                  ),
                ),
                validator: _validatePassword, 
              ),
              SizedBox(height: screenSize.height * 0.05), 

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _authservice.signIn(
                      emailController.text,
                      passwordController.text,
                    ).then((user) {
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    });
                  }
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

              const Text(
                'Or login with',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.02), 

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                },
                    icon: Icon(Icons.facebook, size: 40, color: Colors.blue[800]),
                  ),

                   IconButton(
                    onPressed: () {
                     },
                    icon: const Icon(Icons.email, size: 40, color: Colors.red),
                  ),

                   IconButton(
                    onPressed: () {
                     },
                    icon: const Icon(Icons.alternate_email,
                        size: 40, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
