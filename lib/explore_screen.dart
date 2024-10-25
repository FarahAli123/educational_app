import 'package:flutter/material.dart';


class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        backgroundColor: Colors.purple[800],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSearchBar(),
              SizedBox(height: 20),

              _buildSectionTitle('Recommended Topics'),
              _buildHorizontalList([
                _buildTopicCard('Mobile Development', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ4zD7uzsQ4_UAzGis3PtDGeYd9sosGDXBQw&s'),
                _buildTopicCard('Cloud Computing', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDFpWk3pM9EqPp0QEcbCxQlWNDQ69oJatvdg&s'),
                _buildTopicCard('Cybersecurity', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUdhPbLPOWMmvyyWtCw6brk3QaIN7L71SCkg&s'),
                _buildTopicCard('Game Development', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo9jloyDhF65sqNyVvEaNV6qZ508bkfWc2hA&s0'),
  
                _buildTopicCard('Augmented Reality', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGvpxFFmm6uoRJ271X0JmbFeOkJDs5Qtt-Sw&s'),
                _buildTopicCard('Database', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyYzjWVrpBMqO6cSX7CsPz_X1W51zK9WmA3g&s'),
                _buildTopicCard('Machine learning', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyPi7pd-qaVYRKwgIKvvQfJxvgwkI85UmZIQ&s'),
                _buildTopicCard('Website Development', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvQ_A1YpPDcscDaiVTYKnCVn2foc3piDKWXg&s'),
              ]),
              SizedBox(height: 20),
              

             
              _buildSectionTitle('Trending Topics'),
              _buildHorizontalList([
                _buildTopicCard('Flutter Development', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpH7UhNyL2C2IJ5Dgl-LmQdMnJ2z8al6mIQ&s'),
                _buildTopicCard('Data Science', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2RzGeikAnS5cPgbYPavFrQmzbb6FVoTjWPw&s'),
                _buildTopicCard('Artificial Intelligence', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsixzp9V9j0_lBI7wOB6w_DCP15bEUnxYsIg&s'),
                _buildTopicCard('Web Development', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHyS7C4SxYeAlzOLl11RvwnatRf7BnOWmWKw&s'),
                _buildTopicCard(' Game Development', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-g86D2NKQTZWG-cdwtsizVkD0ZafKCMHOwQ&s'),
                _buildTopicCard('Virtual reality', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkl7BRTUf35EyIXyExdSmATmNiBO08rE_oYw&s'),
                _buildTopicCard('software Contruction and devlopement', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4gaAgTohqKNWj8KbetJqaM_-sx11JgNoPEQ&s'),
                _buildTopicCard('Cybersecurity', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0BKyZk7T4dZWB9sE7B3dxn0oSkYRnNTPh2A&s'),
              ]),
              SizedBox(height: 20),

              _buildSectionTitle('Upcoming Events'),
              _buildVerticalList([
                _buildEventCard(
                  title: 'Flutter & Dart Conference 2024',
                  description: 'Join us for an amazing Flutter and Dart conference.',
                  date: 'March 10, 2024',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpH7UhNyL2C2IJ5Dgl-LmQdMnJ2z8al6mIQ&s',
                ),
                _buildEventCard(
                  title: 'AI & Machine Learning Workshop',
                  description: 'Hands-on workshop on AI and ML concepts.',
                  date: 'April 15, 2024',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsixzp9V9j0_lBI7wOB6w_DCP15bEUnxYsIg&s',
                ),
                _buildEventCard(
                  title: 'Flutter & Dart Conference 2024',
                  description: 'Join us for an amazing Flutter and Dart conference.',
                  date: 'March 10, 2024',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ4zD7uzsQ4_UAzGis3PtDGeYd9sosGDXBQw&s',
                ),
                _buildEventCard(
                  title: 'Cybersecurity',
                  description: 'Join us for an amazing Flutter and Dart conference.',
                  date: 'March 10, 2024',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0BKyZk7T4dZWB9sE7B3dxn0oSkYRnNTPh2A&s',
                ),
                _buildEventCard(
                  title: 'Virtual Reality',
                  description: 'Join us for an amazing Flutter and Dart conference.',
                  date: 'March 10, 2024',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkl7BRTUf35EyIXyExdSmATmNiBO08rE_oYw&s',
                ),
                _buildEventCard(
                  title: 'Web Development',
                  description: 'Join us for an amazing Flutter and Dart conference.',
                  date: 'March 10, 2024',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHyS7C4SxYeAlzOLl11RvwnatRf7BnOWmWKw&s',
                ),
                _buildEventCard(
                  title: 'Data science',
                  description: 'Join us for an amazing Flutter and Dart conference.',
                  date: 'March 10, 2024',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2RzGeikAnS5cPgbYPavFrQmzbb6FVoTjWPw&s',
                ),
                _buildEventCard(
                  title: 'DataBase',
                  description: 'Join us for an amazing Flutter and Dart conference.',
                  date: 'March 10, 2024',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyYzjWVrpBMqO6cSX7CsPz_X1W51zK9WmA3g&s',
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Search Bar Widget
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Topics, Courses, or Events',
        prefixIcon: Icon(Icons.search, color: Colors.purple[800]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.purple[800],
      ),
    );
  }

  // Horizontal List for Topics
  Widget _buildHorizontalList(List<Widget> items) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
  }

  // Vertical List for Events
  Widget _buildVerticalList(List<Widget> items) {
    return Column(
      children: items,
    );
  }

  // Topic Card Widget
  Widget _buildTopicCard(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 120,
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
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                imageUrl,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Event Card Widget
  Widget _buildEventCard({
    required String title,
    required String description,
    required String date,
    required String image,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 4,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(15.0)),
            child: Image.network(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(color: Colors.purple[800], fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

