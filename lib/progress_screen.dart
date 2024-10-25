import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final CollectionReference _eduRef = FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("educational_app");

    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text('My Progress'),
        backgroundColor: Colors.purple[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 10.0,
                  animation: true,
                  percent: 0.75,
                  center: Text(
                    "75%",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  footer: Text(
                    "Overall Progress",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 30),

              Text(
                'Milestones',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
              SizedBox(height: 10),
              _buildMilestoneTracker(),

              SizedBox(height: 30),

              Text(
                'Your Courses',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),

              SizedBox(
                height: 400, 
                child: StreamBuilder(
                  stream: _eduRef.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error"));
                    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text("No data"));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var edu = snapshot.data!.docs[index];
                          return Card(
                            margin: EdgeInsets.only(bottom: 20),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      edu["image"],
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          edu["title"],
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple[800],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        LinearPercentIndicator(
                                          lineHeight: 8.0,
                                          percent: edu["progress"],
                                          progressColor: Colors.deepPurple,
                                          backgroundColor: Colors.grey[300],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "${(edu["progress"] * 100).toInt()}% Completed",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMilestoneTracker() {
    List<String> labels = ['0%', '25%', '50%', '75%', '100%'];
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.lightGreen,
      Colors.green,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(labels.length, (index) {
        return Column(
          children: [
            _buildMilestoneDot(colors[index], index == 0),
            SizedBox(height: 5),
            Text(
              labels[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: index == 0 ? Colors.red : Colors.grey,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildMilestoneDot(Color color, bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 20 : 15,
      width: isActive ? 20 : 15,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? Colors.deepPurple : Colors.grey,
          width: 2,
        ),
      ),
      child: Center(
        child: isActive
            ? Icon(Icons.check, color: Colors.white, size: 12)
            : SizedBox.shrink(),
      ),
    );
  }
}
