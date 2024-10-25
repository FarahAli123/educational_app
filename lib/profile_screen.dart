import 'package:educational_app/settings_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],  
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        elevation: 0,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRatVzDGmEFyVULU8VupVmqasEG7Ia7fJxTcw&s',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Flutter Developer | Learner',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('Courses', '12'),
                      _buildStatItem('Badges', '8'),
                      _buildStatItem('XP Points', '1250'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Text(
                'Your Achievements',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              SizedBox(height: 10),
              _buildBadgesSection(),
              SizedBox(height: 20),

              Text(
                'About Me',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'I am a passionate learner, constantly exploring new skills in Flutter development and mobile app design. My goal is to create impactful applications.',
                  style: TextStyle(color: Colors.purple[700], fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SettingsScreen()) );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[800],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: Icon(Icons.settings, color: Colors.white),
                label: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.purple[800],
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.purple[600],
          ),
        ),
      ],
    );
  }

  Widget _buildBadgesSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBadge('https://t4.ftcdn.net/jpg/04/72/66/43/360_F_472664367_UFQe3RdR4Qw99nCxQSKVKERDPBzJGPqn.jpg', 'Beginner'),
        _buildBadge('https://prodcdn.sporty.co.nz/cms/7080/54595/417172/9f428246-9629-43f3-a7ef-1acb05cc74d7_wo.jpg', 'Intermediate'),
        _buildBadge('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT1eyvrU0Mpyq7I8PIzAkI5xsjhaGadUwCiw&s', 'Advanced'),
      ],
    );
  }

  
  Widget _buildBadge(String imageUrl, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.purple[700]),
        ),
      ],
    );
  }
}
