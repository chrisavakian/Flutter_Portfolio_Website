import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      duration: const Duration(milliseconds: 800),
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
    const iconColor = Colors.white; // Fixed to white

    return MaterialApp(
      title: 'Christopher Avakian',
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
              const SizedBox(width: 20),
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
              const SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(1070),
                child: Text(
                  'Resume',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 20),
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Section 1: Photo and Text
                Container(
                  height: 750,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
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
                          const SizedBox(height: 20),
                          const Text(
                            'Christopher Avakian',
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                      _launchURL('https://drive.google.com/drive/folders/1l8tv6YZKZVPiByqB9SFaVnOYRA0u6vKA?usp=sharing'),
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
                          icon: const Icon(
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
                const SizedBox(height: 20),
                // Section 3: About
                Container(
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/my_photo.png'), 
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 18, color: textColor),
                            children: const [
                              TextSpan(
                                text: 'About Me:\n',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Hi my name is Christopher Avakian, I grew up and currently live in Burbank, California but lived in the bay area for a few years. I graduated in EECS at UC Berkeley and I am currently pursuing a Masters in Computer Science at Cal Poly Pomona. I am an up and coming Software Engineer and I have a passion for efficient and consise systems and working on teams to solve tough problems. In my free time I really love biking, and am looking at mountain biking soon. This website is a display of my past experiences, interests, and projects.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
// Section 4: Experience
Container(
  padding: const EdgeInsets.all(50),
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
              'EDUCATION',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 0),
            Container(
              height: 3,
              color: Colors.teal,
              width: 130,
            ),
            const SizedBox(height: 220), // Adjusted spacing
            Text(
              'EXPERIENCE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 0),
            Container(
              height: 3,
              color: Colors.teal,
              width: 140,
            ),

            const SizedBox(height: 1400), // Adjusted spacing
            Text(
              'SKILLS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 0),
            Container(
              height: 3,
              color: Colors.teal,
              width: 75,
            ),
          ],
        ),
      ),
      const SizedBox(width: 40),
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'University of California, Berkeley, CA',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bachelor of Science in EECS • Aug 2022 - May 2024\n\t\t\t• Relevant Coursework: Machine Learning, Algorithms, Cybersecurity',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            const SizedBox(height: 20),
            Text(
              'California Polytechnic State University, Pomona',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Master of Science in Computer Science • Aug 2024 - May 2026 (Expected)',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            
            const SizedBox(height: 60),
            Text(
              'Founding Full Stack Software Engineer, TrailMarker (August 2023 - January 2024)',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,),
            ),
            const SizedBox(height: 10), // Adjusted spacing
            Text(
              '• Designed and developed the foundations of the company’s new app in Flutter.\n• Led the design and development of over a third of the project, adapting to evolving design and technical requirements.\n• Improved development efficiency by implementing automated testing and continuous integration, reducing deployment times by 56.3% and increasing efficiency by 83.2%.',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            
            const SizedBox(height: 30),
            Text(
              'Lead Systems Engineer, NASA Community College Aerospace Scholars (October 2021 – March 2022)',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,),
            ),
            const SizedBox(height: 10), // Adjusted spacing
            Text(
              '• Led a sub team of 5 members in a competitive simulation among 10 other teams to design a spacecraft for a lunar mission. Our rocket design was not only the most cost-effective but also carried the highest payload mass, earning us 2nd place.\n• Authored a comprehensive Mission Report on In-Situ Resource Utilization (ISRU) on the lunar surface.',
              style: TextStyle(fontSize: 18, color: textColor),
            ),

                        const SizedBox(height: 30),
            Text(
              'Machine Learning Projects',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,),
            ),
            Text(
              'GitHub: https://github.com/chrisavakian/LLM-Projects',
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,),
            ),
            const SizedBox(height: 10), // Adjusted spacing
            Text(
              '• Coded a variety of foundational Machine Learning models such as Neural Networks, Support Vector Machines (SVM), Gaussian Discriminant Analysis (GDA), Regression, Random Forests/Decision Trees, AdaBoost.',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            
            const SizedBox(height: 30),
            Text(
              'RISC-V CPU',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,),
            ),
            Text(
              'GitHub: https://github.com/chrisavakian/RISC-V-CPU-Verilog',
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,),
            ),
            const SizedBox(height: 10), // Adjusted spacing
            Text(
              '• Designed and developed a RISC-V CPU from the ground up using Verilog.\n• Implemented key architectural features, including:\n\t\t\t• Pipelining to increase CPU performance.\n\t\t\t• Branch prediction to minimize pipeline stalls and improve efficiency.\n\t\t\t• Developed a comprehensive datapath, ensuring accurate data flow and control throughout the CPU.\n• Conducted thorough testing and validation, ensuring the CPU met all functional and performance requirements.',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            
            const SizedBox(height: 30),
            Text(
              'Microfabrication Laboratory',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,),
            ),
            const SizedBox(height: 10), // Adjusted spacing
            Text(
              '•	Executed key fabrication processes, including thermal oxidation, ion implantation, impurity diffusion, film deposition, lithography, etching, contacts, interconnections, and MEMS devices.\n•	Manufactured advanced MOSFETs and poly-Si surface microstructures, contributing to cutting-edge microfabrication advancements.\n•	Performed post-fabrication measurements on silicon devices to verify functionality and adherence to design specifications.',
              style: TextStyle(fontSize: 18, color: textColor),
            ),

            const SizedBox(height: 30),
            Text(
              'MOSFET Design Project',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: textColor,),
            ),
            const SizedBox(height: 10), // Adjusted spacing
            Text(
              '•	Designed a MOSFET to specific requirements using Synopsys Sentaurus.\n•	Utilized advanced simulation tools to optimize device parameters, ensuring the MOSFET met the given specifications for performance and reliability.\n•	Conducted detailed analysis of electrical characteristics, including threshold voltage, on/off current ratio, and subthreshold swing.',
              style: TextStyle(fontSize: 18, color: textColor),
            ),

            const SizedBox(height: 40),
const SizedBox(height: 10),
RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 20, color: textColor),
    children: const [
      TextSpan(
        text: '•	Hardware Skills: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: 'Verilog, LTspice, Synopsys Sentaurus, Circuit Design, PCB Design, Low Voltage Design, Control Circuits, Sensor Management\n\n',
      ),
      TextSpan(
        text: '•	Technical Skills: ',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: 'Machine Learning, Neural Networks, Back Propagation Lab Experience: Clean room experience, versed in lab safety procedures\n\n',
      ),
      TextSpan(
        text: '• Proficient in Debian, Arch, and Fedora based Linux distros',
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}