import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bushra Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final projects = [
  
    {
      'name': 'Restaurant App',
      'description':
          'A Flutter application showcasing restaurant menus with an attractive and responsive UI.',
    },
    {
      'name': 'Personal Music App',
      'description':
          'A modern Flutter music player application with playlists and clean UI.',
    },
    {
      'name': 'Portfolio App',
      'description':
          'A personal portfolio application built using Flutter to showcase my profile and projects.',
    },
  ];

  final socialLinks = [
    {
      'label': 'GitHub',
      'icon': Icons.code,
      'url': 'https://github.com/yourusername',
    },
    {
      'label': 'LinkedIn',
      'icon': Icons.business_center,
      'url': 'https://linkedin.com/in/yourusername',
    },
    {
      'label': 'Instagram',
      'icon': Icons.camera_alt,
      'url': 'https://instagram.com/yourusername',
    },
    {
      'label': 'Email',
      'icon': Icons.email,
      'url': 'mailto:yourmail@gmail.com',
    },
  ];

  String selectedProject = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portfolio"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.teal,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/profile.png",
                          width: 125,
                          height: 125,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "S. Bushra Firdous",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Final Year BCA Student",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Flutter Developer • UI/UX Designer",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              buildSectionTitle("About Me"),

              const SizedBox(height: 10),

              const Text(
                "Hello! I'm S. Bushra Firdous, a final-year BCA student at "
                "KLE's GH BCA College, Haveri. I am passionate about Flutter "
                "development, UI/UX design, and building modern applications. "
                "I enjoy solving real-world problems through technology and "
                "continuously learning new skills.",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              buildSectionTitle("Skills"),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  Chip(label: Text("Flutter")),
                  Chip(label: Text("Dart")),
                  Chip(label: Text("Java")),
                  Chip(label: Text("Python")),
                  Chip(label: Text("HTML")),
                  Chip(label: Text("CSS")),
                  Chip(label: Text("JavaScript")),
                  Chip(label: Text("SQL")),
                  Chip(label: Text("UI/UX")),
                  Chip(label: Text("Figma")),
                ],
              ),

              const SizedBox(height: 30),

              buildSectionTitle("Projects"),

              const SizedBox(height: 10),

              ...projects.map((project) {
                final projectName = project['name'] as String;
                final description = project['description'] as String;
                final isSelected = selectedProject == projectName;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.folder),
                            label: Text(projectName),
                            onPressed: () {
                              setState(() {
                                selectedProject =
                                    isSelected ? "" : projectName;
                              });
                            },
                          ),
                          if (isSelected) ...[
                            const SizedBox(height: 10),
                            Text(description),
                          ]
                        ],
                      ),
                    ),
                  ),
                );
              }),

              const SizedBox(height: 30),

              buildSectionTitle("Connect With Me"),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: socialLinks.map((link) {
                  return SocialLinkChip(
                    icon: link['icon'] as IconData,
                    label: link['label'] as String,
                    url: link['url'] as String,
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  "© 2026 S. Bushra Firdous",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SocialLinkChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const SocialLinkChip({
    super.key,
    required this.icon,
    required this.label,
    required this.url,
  });

  Future<void> _launchURL() async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon),
      label: Text(label),
      onPressed: _launchURL,
    );
  }
}