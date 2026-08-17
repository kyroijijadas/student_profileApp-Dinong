import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatefulWidget {
  const StudentProfileApp({super.key});

  @override
  State<StudentProfileApp> createState() => _StudentProfileAppState();
}

class _StudentProfileAppState extends State<StudentProfileApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Student Profile App',
      themeMode: _themeMode,

      // LIGHT THEME CONFIGURATION
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F3F8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF40426D),
          primary: const Color(0xFF40426D),
          surface: Colors.white,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F3F8),
          foregroundColor: Color(0xFF312C51),
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
        ),
      ),

      // DARK THEME CONFIGURATION
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF312C51),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF40426D),
          primary: const Color(0xFFF0C38E),
          surface: const Color(0xFF40426D),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF312C51),
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF40426D),
        ),
      ),

      home: ProfileScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const ProfileScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showMotto = false;

  void _toggleMotto() {
    setState(() {
      _showMotto = !_showMotto;
    });
  }

  Widget _buildActionIcon(IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        size: 18,
        color: iconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;

    final textColor = isDark ? Colors.white : const Color(0xFF312C51);
    final subtextColor = isDark ? Colors.white70 : Colors.black87;
    final primaryAccent = isDark ? const Color(0xFFF0C38E) : const Color(0xFF40426D);
    final secondaryAccent = isDark ? const Color(0xFFF1AA9B) : const Color(0xFF312C51);
    final cardBgColor = isDark ? const Color(0xFF40426D) : Colors.white;
    final dividerColor = isDark ? const Color(0xFF312C51) : Colors.grey.shade300;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Student Profile App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Hi Welcome to My Student Profile App',
                applicationVersion: 'by me Joshuel Dinong',
                children: [
                  const Text('Built using Flutter Material 3 components.'),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Dark/Light Mode Toggle Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: widget.onToggleTheme,
                  icon: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    color: isDark ? const Color(0xFF312C51) : Colors.white,
                  ),
                  label: Text(
                    isDark ? 'Light Mode' : 'Dark Mode',
                    style: TextStyle(
                      color: isDark ? const Color(0xFF312C51) : Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? const Color(0xFFF0C38E)
                        : const Color(0xFF40426D),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Header Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: cardBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://scontent.fmnl13-4.fna.fbcdn.net/v/t1.15752-9/775318453_1602238641412810_9152266403654461743_n.jpg?stp=dst-jpg_s640x640_tt6&_nc_cat=108&_nc_map=urlgen_bucketless&ccb=1-7&_nc_sid=0024fc&_nc_eui2=AeE2aMlPRBswRm5mSLjkc9xdqi4K-dBn1cmqLgr50GfVyep6tkpaPkK-hVN0XmO0yuxQH1wK-NCmazSDHlJRO2Xe&_nc_ohc=LTUBGvgMLewQ7kNvwEhC8KV&_nc_oc=AdqlPGSPJjXZqmwEdym4Js-adM9uCqOCRapN1_y2OGGSlkGcEWmJ7rd09dCrikbaWPg&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=scontent.fmnl13-4.fna&_nc_ss=7a22e&oh=03_Q7cD6AH5kwAqELRXXd1xfKRJ_mJrTHOm9eq3MP4603bFsRNVhQ&oe=6AAA5527',
                        width: 130,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Joshuel Dinong',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '"well"',
                            style: TextStyle(
                              fontSize: 14,
                              color: primaryAccent,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: primaryAccent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'BSIT - 3IT-B',
                              style: TextStyle(
                                color: isDark ? const Color(0xFF312C51) : Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              _buildActionIcon(
                                Icons.email,
                                Colors.orangeAccent,
                                Colors.white,
                              ),
                              const SizedBox(width: 8),
                              _buildActionIcon(
                                Icons.facebook,
                                Colors.blueAccent,
                                Colors.white,
                              ),
                              const SizedBox(width: 8),
                              _buildActionIcon(
                                Icons.tiktok,
                                Colors.black87,
                                Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Motto Card
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.format_quote, color: primaryAccent),
                              const SizedBox(width: 8),
                              Text(
                                'Personal Motto',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: _toggleMotto,
                            child: Text(
                              _showMotto ? 'Hide' : 'Reveal',
                              style: TextStyle(color: secondaryAccent),
                            ),
                          ),
                        ],
                      ),
                      if (_showMotto) ...[
                        Divider(color: dividerColor),
                        const SizedBox(height: 4),
                        Text(
                          '"It is what it is."',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: primaryAccent,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Personal Information Card
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryAccent,
                          ),
                        ),
                      ),
                      Divider(color: dividerColor),
                      ListTile(
                        leading: const Icon(Icons.cake, color: Colors.indigoAccent),
                        title: Text('Age / Birthday', style: TextStyle(color: textColor)),
                        subtitle: Text('20 years old (August 2, 2006)', style: TextStyle(color: subtextColor)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home, color: Colors.orangeAccent),
                        title: Text('Address', style: TextStyle(color: textColor)),
                        subtitle: Text('Cabuyao, Laguna, Philippines', style: TextStyle(color: subtextColor)),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.sports_esports,
                          color: Colors.greenAccent,
                        ),
                        title: Text('Hobbies', style: TextStyle(color: textColor)),
                        subtitle: Text(
                          'Building Gunpla Models, Web Dev, Gaming, Music',
                          style: TextStyle(color: subtextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Academic Information Card
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Academic Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryAccent,
                          ),
                        ),
                      ),
                      Divider(color: dividerColor),
                      ListTile(
                        leading: Icon(Icons.school, color: isDark ? Colors.white : Colors.black87),
                        title: Text('Course / Section', style: TextStyle(color: textColor)),
                        subtitle: Text(
                          'BS Information Technology - Section 3IT-B',
                          style: TextStyle(color: subtextColor),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.book, color: Colors.orangeAccent),
                        title: Text('Favorite Subject', style: TextStyle(color: textColor)),
                        subtitle: Text(
                          'Prototyping & Web Development',
                          style: TextStyle(color: subtextColor),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.code, color: Colors.purpleAccent),
                        title: Text('Programming Languages', style: TextStyle(color: textColor)),
                        subtitle: Text(
                          'Java, Kotlin, Dart, JavaScript, PHP, SQL',
                          style: TextStyle(color: subtextColor),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.build, color: Colors.greenAccent),
                        title: Text('Technical Skills', style: TextStyle(color: textColor)),
                        subtitle: Text(
                          'Web Development, UI/UX Prototyping (Figma), App Development',
                          style: TextStyle(color: subtextColor),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.flag, color: Colors.pinkAccent),
                        title: Text('Career Goal', style: TextStyle(color: textColor)),
                        subtitle: Text(
                          'Full-Stack Web & Mobile Developer',
                          style: TextStyle(color: subtextColor),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.lightbulb, color: Colors.amber),
                        title: Text('Academic Interest', style: TextStyle(color: textColor)),
                        subtitle: Text(
                          'Data Structures & OOP, Web Development, Mobile App Development, UI/UX Design',
                          style: TextStyle(color: subtextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
