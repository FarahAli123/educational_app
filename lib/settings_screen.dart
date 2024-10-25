import 'package:educational_app/profile_screen.dart';
import 'package:educational_app/welcome_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
      ),
      backgroundColor: Colors.purple[50],
      body: ListView(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        children: [
          _buildSectionHeader('Account', screenWidth),
          ListTile(
            leading: Icon(Icons.person, color: Colors.purple[800]),
            title: Text('Account Info'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.purple[800]),
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
            onTap: () {
              // Implement password change functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.purple[800]),
            title: Text('Log Out'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
                (Route<dynamic> route) => false, // This clears the entire stack
              );
            },
          ),
          Divider(),

          _buildSectionHeader('Notifications', screenWidth),
          SwitchListTile(
            activeColor: Colors.purple[800],
            title: Text('Email Notifications'),
            value: true,
            onChanged: (bool value) {
              // Handle email notification switch
            },
          ),
          SwitchListTile(
            activeColor: Colors.purple[800],
            title: Text('Push Notifications'),
            value: false,
            onChanged: (bool value) {
              // Handle push notification switch
            },
          ),
          Divider(),

          _buildSectionHeader('Privacy', screenWidth),
          ListTile(
            leading: Icon(Icons.lock_outline, color: Colors.purple[800]),
            title: Text('Privacy Settings'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
            onTap: () {
              // Implement privacy settings functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.delete_forever, color: Colors.purple[800]),
            title: Text('Delete Account'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
            onTap: () {
              // Implement delete account functionality here
            },
          ),
          Divider(),

          _buildSectionHeader('General', screenWidth),
          ListTile(
            leading: Icon(Icons.language, color: Colors.purple[800]),
            title: Text('Language'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
            onTap: () {
              // Implement language change functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.palette, color: Colors.purple[800]),
            title: Text('Theme'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
            onTap: () {
              // Implement theme change functionality here
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.purple[800]),
            title: Text('About'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[800]),
            onTap: () {
              // Implement about functionality here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02), // Responsive padding
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.purple[800],
        ),
      ),
    );
  }
}
