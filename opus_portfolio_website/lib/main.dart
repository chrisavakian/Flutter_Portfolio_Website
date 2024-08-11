import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ScrollController _scrollController = ScrollController();
  bool _isDarkMode = false;
  bool _isHoveringLinkedIn = false;
  bool _isHoveringGithub = false;
  bool _isHoveringResume = false;

  void _scrollToSection(double position) {
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isDarkMode ? Colors.grey[900] : Colors.grey[100];
    final textColor = _isDarkMode ? Colors.white : Colors.black;
    final iconColor = Colors.white; // Fixed to white

    return MaterialApp(
      title: 'My Website',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _scrollToSection(0),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(750),
                child: Text(
                  'About',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(1050),
                child: Text(
                  'Experience',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: _toggleDarkMode,
                icon: Icon(
                  _isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Section 1: Photo and Text
                Container(
                  height: 750,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Christopher Avakian',
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // LinkedIn Icon
                              MouseRegion(
                                onEnter: (_) => setState(() => _isHoveringLinkedIn = true),
                                onExit: (_) => setState(() => _isHoveringLinkedIn = false),
                                child: GestureDetector(
                                  onTap: () => _launchURL(
                                      'https://www.linkedin.com/in/christopheravakian2/'),
                                  child: FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    size: 50,
                                    color: iconColor.withOpacity(
                                        _isHoveringLinkedIn ? 0.7 : 1.0),
                                  ),
                                ),
                              ),
                              // GitHub Icon
                              MouseRegion(
                                onEnter: (_) => setState(() => _isHoveringGithub = true),
                                onExit: (_) => setState(() => _isHoveringGithub = false),
                                child: GestureDetector(
                                  onTap: () =>
                                      _launchURL('https://github.com/chrisavakian'),
                                  child: FaIcon(
                                    FontAwesomeIcons.github,
                                    size: 50,
                                    color: iconColor.withOpacity(
                                        _isHoveringGithub ? 0.7 : 1.0),
                                  ),
                                ),
                              ),
                              // Resume Icon (remove this one)
                              MouseRegion(
                                onEnter: (_) => setState(() => _isHoveringResume = true),
                                onExit: (_) => setState(() => _isHoveringResume = false),
                                child: GestureDetector(
                                  onTap: () =>
                                      _launchURL('https://drive.google.com/file/d/1OdC_rRugtUAqyOu7xYnxrGFKyBx9jhT_/view?usp=sharing'),
                                  child: FaIcon(
                                    FontAwesomeIcons.file,
                                    size: 50,
                                    color: iconColor.withOpacity(
                                        _isHoveringResume ? 0.7 : 1.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_downward,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: () => _scrollToSection(750),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Section 3: About
                Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/my_photo.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 18, color: textColor),
                            children: [
                              TextSpan(
                                text: 'About Me: \n',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Test',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Section 4: Experience
                Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 150),
                            Text(
                              'Experience:',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: textColor,
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
                              'Bachelor of Science in Electrical Engineering and Computer Science\nUC Berkeley\nGraduation Date: May 2024',
                              style: TextStyle(fontSize: 18, color: textColor),
                            ),
                            SizedBox(height: 120),
                            Text(
                              'Software Engineer Intern\nABC Company\nJune 2022 - August 2022\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\d',
                              style: TextStyle(fontSize: 18, color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}