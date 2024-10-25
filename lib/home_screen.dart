
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_app/explore_screen.dart';
import 'package:educational_app/profile_screen.dart';
import 'package:educational_app/progress_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  
  final List<Widget> _screens = [
    CoursesScreen(),
    ExploreScreen(),
    ProfileScreen(),
    ProgressScreen(),
  ];

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      backgroundColor: Colors.purple[100],
      
      body: _screens[_currentIndex], // Display the selected screen

      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, 
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        backgroundColor: Colors.purple[800],  
        selectedItemColor: Colors.white,  
        unselectedItemColor: Colors.purple[200], 
        type: BottomNavigationBarType.fixed, 
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}


class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Flutter for Beginners',
      'description': 'Learn the basics of Flutter and build beautiful apps.',
      'progress': 0.6,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRatVzDGmEFyVULU8VupVmqasEG7Ia7fJxTcw&s'
    },
    {
      'title': 'Advanced Machine Learning',
      'description': 'Dive deep into machine learning algorithms.',
      'progress': 0.3,
      'image': 'https://www.simplilearn.com/ice9/free_resources_article_thumb/Deep-Learning-vs-Machine-Learning.jpg'
    },
    {
      'title': 'Data Science with Python',
      'description': 'Analyze data and create stunning visualizations.',
      'progress': 0.8,
      'image': 'https://www.mygreatlearning.com/blog/wp-content/uploads/2019/09/What-is-data-science-2.jpg'
    },
    {
      'title': 'UI/UX Design Essentials',
      'description': 'Learn the fundamentals of UI/UX design.',
      'progress': 0.4,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4GcFxzAEwvICnbb9Q_i7dZE3dM93TaU5SyA&s'
    },
    {
      'title': 'Augmented Reality Basics',
      'description': 'Learn AR VR basics.',
      'progress': 0.9,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHpklldkS2JZDQ8u4aZV-t323yt4eNynoMHg&s'
    },
    {
      'title': 'Learn Devops',
      'description': 'Learn devops.',
      'progress': 0.7,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzZbPuZjGxWiJU0iXKaAXATnoI6PzCxMrb66h5QPr8JmIZWvgvUBkcvb2hbo2crBbDnIk&usqp=CAU'
    },
    {
      'title': 'Learn html and css',
      'description': 'Learn html css.',
      'progress': 0.5,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgZ-XNf77w59wHsEbbc-xFCukxy2uoeWJbJg&s'
    },
  ];

  @override
  Widget build(BuildContext context) {

 final CollectionReference _eduRef = FirebaseFirestore.instance.collection("user")
    .doc(uid).collection("educational_app");


    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: Colors.purple[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Courses',
                  prefixIcon: Icon(Icons.search, color: Colors.purple[800]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildCategoryChip('Development', Icons.code),
                    _buildCategoryChip('Design', Icons.palette),
                    _buildCategoryChip('Data Science', Icons.bar_chart),
                    _buildCategoryChip('Business', Icons.business),
                    _buildCategoryChip('Marketing', Icons.campaign),
                  ],
                ),
              ),
              SizedBox(height: 20),

          
              Text(
                'Featured Courses',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return _buildFeaturedCourseCard(courses[index]);
                  },
                ),
              ),
              SizedBox(height: 80),

            
              Text(
                'All Courses',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      _eduRef.add({
                        "title": courses[index]["title"],
                        "description" : courses[index]["description"],
                        "image" : courses[index]["image"],
                        "progress": courses[index]["progress"]

                      });
                 print(courses[index]["description"]);
                 print(courses[index]["title"]);
                    },
     child: Card(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
     margin: EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    
                                    courses[index]['image'],
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                    Text(
                      courses[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      courses[index]['description'],
                      style: TextStyle(color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    LinearProgressIndicator(
                      value: courses[index]['progress'],
                      backgroundColor: Colors.purple[100],
                      color: Colors.purple[800],
                    ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _buildCategoryChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Chip(
        label: Text(label, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[800],
        avatar: Icon(icon, color: Colors.white),
      ),
    );
  }

  
  Widget _buildFeaturedCourseCard(Map<String, dynamic> course) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), 
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 160,
              width: 180,
              child: Stack(
                children:[
                  
                  ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0), 
                      topRight: Radius.circular(15.0)),
                  child: Image.network(
                    course['image'],
                    height: 180,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                
                Align(
             alignment: Alignment.bottomCenter,
             child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                     topRight: Radius.circular(12),
                  ),

              ),
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                child: Text(
                  course['title'],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             ),
                ),
                
                ] 
              ),
              
            ),

            
            
          ],
        ),
      ),
    );
  }

  
  Widget _buildCourseListItem(Map<String, dynamic> course) {
    return Text('');
  }
}



  









