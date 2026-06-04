import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dhivya Portfolio',
      theme: ThemeData.dark(),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.cyan,
        ),
      ),
    );
  }

  Widget skillChip(String skill) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(skill),
    );
  }

  Widget projectCard(
      String title,
      String description,
      ) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 30),

            const Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Dhivya Palraj",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Center(
              child: Text(
                "Frontend Developer | Flutter Developer",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Udumalpet, India\n"
                    "+91 63693 72912\n"
                    "dhivya032005@gmail.com",
                textAlign: TextAlign.center,
              ),
            ),

            sectionTitle("About Me"),

            const Text(
              "Frontend Developer with knowledge of HTML, CSS, JavaScript, React.js, Flutter, Dart and Flask. Experienced in building responsive applications and user-friendly interfaces. Strong problem-solving abilities with leadership experience and interest in modern technologies.",
              style: TextStyle(fontSize: 16),
            ),

            sectionTitle("Skills"),

            Wrap(
              children: [
                skillChip("HTML"),
                skillChip("CSS"),
                skillChip("JavaScript"),
                skillChip("React.js"),
                skillChip("Flutter"),
                skillChip("Dart"),
                skillChip("Flask"),
                skillChip("MySQL"),
              ],
            ),

            sectionTitle("Education"),

            const Card(
              child: ListTile(
                title: Text("BCA"),
                subtitle: Text(
                    "Sree Saraswathi Thyagaraja College, Pollachi\nPercentage: 72%"),
              ),
            ),

            const SizedBox(height: 10),

            const Card(
              child: ListTile(
                title: Text("HSC"),
                subtitle: Text(
                    "Sri Kannikaparameswari Hr. Sec. School\nPercentage: 86%"),
              ),
            ),

            sectionTitle("Projects"),

            projectCard(
              "Calc Pro",
              "Responsive calculator application with normal and scientific calculator features using React.js. Includes MongoDB-based calculation history tracking.",
            ),

            projectCard(
              "AI Resume Parser & Analyzer",
              "AI-powered resume parser using NLP, spaCy, NLTK, Streamlit and MySQL for extracting candidate details and skill visualization.",
            ),

            projectCard(
              "Online Voting System",
              "Secure Flask and MySQL based voting application with authentication, voter registration and session-based security.",
            ),

            sectionTitle("Experience"),

            const Card(
              child: ListTile(
                title: Text("Department Secretary"),
                subtitle: Text(
                  "Led department activities, coordinated events and collaborated with faculty and students.",
                ),
              ),
            ),

            sectionTitle("Certifications"),

            const Text("• Learning Fullstack React"),
            const Text("• Database Management System"),

            sectionTitle("Achievements"),

            const Text(
                "🏆 First Prize - Expodia'26 Hardware & Software Expo"),
            const Text(
                "🇯🇵 NAT Japanese Language Test - N5 Level"),
            const Text(
                "📚 Shortlisted in NISM-SEBI NFLQ 2026 College Round"),

            sectionTitle("Contact"),

            const Text("📧 dhivya032005@gmail.com"),
            const Text("💼 linkedin.com/in/dhivya003"),
            const Text("💻 github.com/itzz-dhivya"),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}