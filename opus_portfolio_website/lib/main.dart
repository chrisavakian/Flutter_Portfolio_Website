import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Website',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Section 1: Photo and Text
              Container(
                height: 500,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/my_photo.jpg'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome to my website!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Section 2: Icons
              Container(
                height: 200,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.code, size: 50),
                    Icon(Icons.link, size: 50),
                    Icon(Icons.mail, size: 50),
                  ],
                ),
              ),
              // Section 3: About
              Container(
                padding: EdgeInsets.all(50),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/my_photo.jpg'),
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nulla sit amet aliquam lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl sit amet nisl. Nullam euismod, nulla sit amet aliquam lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl sit amet nisl.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              // Section 4: Experience
Container(
  padding: EdgeInsets.all(50),
  color: Colors.blue,
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Education:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Experience:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 50),
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bachelor of Science in Computer Science\nXYZ University\nGraduation Date: May 2023',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Software Engineer Intern\nABC Company\nJune 2022 - August 2022',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    ],
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}