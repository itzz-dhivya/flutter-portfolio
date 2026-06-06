import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const DhivyaPortfolio());

// ─── TOKENS ─────────────────────────────────────────────────────
const kBg      = Color(0xFF04080F);
const kSurface = Color(0xFF0B1120);
const kCard    = Color(0xFF0F1A2E);
const kAccent  = Color(0xFF00FFD1);
const kAccent2 = Color(0xFF6C63FF);
const kAccent3 = Color(0xFFFF6B6B);
const kAccent4 = Color(0xFFFFB347);
const kAccent5 = Color(0xFF4FC3F7);
const kText    = Color(0xFFF0F4FF);
const kMuted   = Color(0xFF5A6A80);
const kBorder  = Color(0xFF1A2A40);

// ─── SOCIAL LINKS ───────────────────────────────────────────────
const kGithubUrl   = 'https://github.com/itzz-dhivya';
const kLinkedinUrl = 'https://www.linkedin.com/in/dhivya003/';
const kEmailUrl    = 'https://mail.google.com/mail/?view=cm&to=dhivya032005@gmail.com';

Future<void> _launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
}

// ─── PROJECTS DATA ──────────────────────────────────────────────
final _projects = [
  {
    'title': 'Fake Job Post Detector',
    'tag': 'C# · MySQL · Backend',
    'emoji': '🔍',
    'color': kAccent3,
    'desc':
        'Identifies suspicious or fake job postings by checking conditions like unrealistic salaries or missing information. Supports CRUD operations for managing job records.',
    'tech': ['C#', 'MySQL', 'CRUD', 'Backend'],
    'learn': 'Database management & backend development using C#',
  },
  {
    'title': 'CRED Clone',
    'tag': 'React.js · Frontend',
    'emoji': '💳',
    'color': kAccent,
    'desc':
        'A responsive CRED-inspired web app with reusable React components, React Router navigation, and a polished UI built with HTML, CSS, and JavaScript.',
    'tech': ['React.js', 'HTML', 'CSS', 'JavaScript', 'React Router'],
    'learn': 'React component architecture & frontend responsiveness',
  },
  {
    'title': 'AI Resume Parser',
    'tag': 'Python · NLP · AI',
    'emoji': '🤖',
    'color': kAccent2,
    'desc':
        'Extracts name, skills, education & experience from PDF/DOCX resumes using spaCy and NLTK. Streamlit dashboard, Aiven Cloud MySQL storage, and Plotly visualizations for HR teams.',
    'tech': ['Python', 'spaCy', 'NLTK', 'Streamlit', 'MySQL', 'Plotly'],
    'learn': 'NLP, tokenization, NER & AI automation for HR workflows',
  },
  {
    'title': 'Online Voting System',
    'tag': 'Flask · MySQL · Security',
    'emoji': '🗳️',
    'color': kAccent4,
    'desc':
        'Secure college election platform with voter registration, login authentication, and session-based security to prevent unauthorized access. Fully responsive UI.',
    'tech': ['Flask', 'MySQL', 'HTML', 'CSS', 'JavaScript', 'Sessions'],
    'learn': 'Secure backend auth & digital election integrity',
  },
  {
    'title': 'Calc Pro',
    'tag': 'React · Node · MongoDB · Full-Stack',
    'emoji': '🧮',
    'color': kAccent5,
    'desc':
        'Full-stack web app with normal & scientific calculator modes. React.js frontend, Node.js + Express.js backend APIs, and MongoDB for storing calculation history with timestamps.',
    'tech': ['React.js', 'Node.js', 'Express.js', 'MongoDB'],
    'learn': 'Full-stack architecture: frontend, API, database integration',
  },
];

const _skills = [
  {'name': 'HTML & CSS',    'pct': 90, 'color': kAccent},
  {'name': 'JavaScript',    'pct': 80, 'color': kAccent},
  {'name': 'React.js',      'pct': 82, 'color': kAccent2},
  {'name': 'Python',        'pct': 78, 'color': kAccent2},
  {'name': 'C# / .NET',     'pct': 70, 'color': kAccent3},
  {'name': 'Flask',         'pct': 68, 'color': kAccent4},
  {'name': 'Node.js',       'pct': 65, 'color': kAccent5},
  {'name': 'SQL / MySQL',   'pct': 75, 'color': kAccent3},
  {'name': 'MongoDB',       'pct': 60, 'color': kAccent5},
  {'name': 'NLP / spaCy',   'pct': 65, 'color': kAccent2},
  {'name': 'Streamlit',     'pct': 70, 'color': kAccent},
  {'name': 'Git & GitHub',  'pct': 85, 'color': kAccent2},
];

// ─── UPDATED CERTIFICATES DATA ───────────────────────────────────
const _certs = [
  // Infosys Springboard – 9 certificates
  {'icon': '📱', 'name': 'Android App Development',  'by': 'Infosys Springboard', 'color': kAccent},
  {'icon': '⚙️', 'name': 'Advanced C',               'by': 'Infosys Springboard', 'color': kAccent},
  {'icon': '🗄️', 'name': 'DB Fundamentals',          'by': 'Infosys Springboard', 'color': kAccent},
  {'icon': '☕', 'name': 'Java SE13',                 'by': 'Infosys Springboard', 'color': kAccent},
  {'icon': '🌐', 'name': 'Full Stack Dev',            'by': 'Infosys Springboard', 'color': kAccent},
  {'icon': '⚛️', 'name': 'Full Stack React',          'by': 'Infosys Springboard', 'color': kAccent},
  {'icon': '📊', 'name': 'Learn R',                   'by': 'Infosys Springboard', 'color': kAccent},
  {'icon': '📈', 'name': 'R Fundamentals',            'by': 'Infosys Springboard', 'color': kAccent},
  {'icon': '💻', 'name': 'VB.NET',                   'by': 'Infosys Springboard', 'color': kAccent},
  // NPTEL – 2 certificates
  {'icon': '🗄️', 'name': 'DBMS',                     'by': 'NPTEL', 'color': kAccent2},
  {'icon': '🖥️', 'name': 'Operating Systems',        'by': 'NPTEL', 'color': kAccent2},
  // Coursera – 2 certificates
  {'icon': '📋', 'name': 'Business Analysis',         'by': 'Coursera', 'color': kAccent3},
  {'icon': '📊', 'name': 'MS Excel',                  'by': 'Coursera', 'color': kAccent3},
  // GreyLearn – 1 certificate
  {'icon': '⚡', 'name': 'C++ Programming',           'by': 'GreyLearn', 'color': kAccent4},
  // Simplilearn – 1 certificate
  {'icon': '🧠', 'name': 'NLP & Text Mining',         'by': 'Simplilearn', 'color': kAccent5},
  // NAT-TEST – 1 certificate
  {'icon': '🇯🇵', 'name': 'Japanese Language N5',     'by': 'NAT-TEST', 'color': kAccent4},
];

// ─── UPDATED AWARDS DATA ─────────────────────────────────────────
const _awards = [
  '🥇  First Prize – Hardware Category, Expodia\'26',
  '🎤  Participant – Eureka Pitching Competition',
  '📈  Shortlisted – NISM‑SEBI National Financial Literacy Quiz 2026',
  '🇯🇵  JLPT N5 Japanese Language Certification',
  '🎓  Department Secretary, Dept. of Computer Applications 2024–25',
];

// ─── ROOT ───────────────────────────────────────────────────────
class DhivyaPortfolio extends StatelessWidget {
  const DhivyaPortfolio({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Dhivya Palraj – Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: kBg,
          fontFamily: 'Courier',
          useMaterial3: true,
        ),
        home: const _Shell(),
      );
}

// ─── SHELL ──────────────────────────────────────────────────────
class _Shell extends StatefulWidget {
  const _Shell();
  @override
  State<_Shell> createState() => _ShellState();
}

class _ShellState extends State<_Shell> with TickerProviderStateMixin {
  final _scroll = ScrollController();
  late AnimationController _bg;
  int _nav = 0;
  final _keys = List.generate(6, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _bg = AnimationController(vsync: this, duration: const Duration(seconds: 14))
      ..repeat(reverse: true);
  }

  @override
  void dispose() { _bg.dispose(); _scroll.dispose(); super.dispose(); }

  void _goto(int i) {
    final ctx = _keys[i].currentContext;
    if (ctx != null) Scrollable.ensureVisible(ctx,
        duration: const Duration(milliseconds: 750), curve: Curves.easeInOutQuart);
    setState(() => _nav = i);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: kBg,
    body: Stack(children: [
      AnimatedBuilder(
        animation: _bg,
        builder: (_, __) => CustomPaint(size: Size.infinite, painter: _OrbPainter(_bg.value)),
      ),
      SingleChildScrollView(
        controller: _scroll,
        child: Column(children: [
          _NavBar(active: _nav, onTap: _goto),
          _HeroSection(key: _keys[0]),
          _AboutSection(key: _keys[1]),
          _ProjectsSection(key: _keys[2]),
          _SkillsSection(key: _keys[3]),
          _AwardsSection(key: _keys[4]),
          _ContactSection(key: _keys[5]),
          const _Footer(),
        ]),
      ),
    ]),
  );
}

// ─── ORB PAINTER ────────────────────────────────────────────────
class _OrbPainter extends CustomPainter {
  final double t;
  _OrbPainter(this.t);
  @override
  void paint(Canvas canvas, Size s) {
    final orbs = [
      (Offset(s.width*(.10+.08*math.sin(t*2*math.pi)), s.height*(.08+.06*math.cos(t*2*math.pi))), kAccent, 320.0),
      (Offset(s.width*(.85+.06*math.cos(t*2*math.pi)), s.height*(.28+.10*math.sin(t*math.pi))),   kAccent2, 280.0),
      (Offset(s.width*(.45+.12*math.sin(t*math.pi+1)), s.height*(.62+.08*math.cos(t*1.5*math.pi))),kAccent3, 240.0),
      (Offset(s.width*(.70+.06*math.cos(t*1.2*math.pi)), s.height*(.85+.05*math.sin(t*2*math.pi))),kAccent4, 200.0),
    ];
    for (final o in orbs) {
      canvas.drawCircle(o.$1, o.$3,
        Paint()..shader = RadialGradient(colors: [o.$2.withOpacity(.09), Colors.transparent])
          .createShader(Rect.fromCircle(center: o.$1, radius: o.$3)));
    }
  }
  @override
  bool shouldRepaint(_OrbPainter old) => old.t != t;
}

// ─── NAVBAR ─────────────────────────────────────────────────────
class _NavBar extends StatelessWidget {
  final int active;
  final void Function(int) onTap;
  const _NavBar({required this.active, required this.onTap});
  static const _labels = ['Home','About','Projects','Skills','Awards','Contact'];
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
    decoration: BoxDecoration(
      color: kBg.withOpacity(.92),
      border: Border(bottom: BorderSide(color: kBorder)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(text: TextSpan(children: [
          TextSpan(text: '<',      style: TextStyle(color: kAccent,  fontSize: 18, fontWeight: FontWeight.bold)),
          TextSpan(text: 'Dhivya',style: TextStyle(color: kText,    fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 1)),
          TextSpan(text: '/>',     style: TextStyle(color: kAccent,  fontSize: 18, fontWeight: FontWeight.bold)),
        ])),
        Row(children: List.generate(_labels.length, (i) {
          final on = i == active;
          return GestureDetector(
            onTap: () => onTap(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(left: 18),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: on ? kAccent.withOpacity(.10) : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: on ? kAccent.withOpacity(.45) : Colors.transparent),
              ),
              child: Text(_labels[i], style: TextStyle(
                color: on ? kAccent : kMuted,
                fontSize: 13,
                fontWeight: on ? FontWeight.w700 : FontWeight.w400,
                letterSpacing: .5,
              )),
            ),
          );
        })),
      ],
    ),
  );
}

// ─── SECTION HEADER ─────────────────────────────────────────────
class _SH extends StatelessWidget {
  final String tag, title;
  const _SH({required this.tag, required this.title});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('// $tag', style: const TextStyle(color: kAccent, fontSize: 12, letterSpacing: 2, fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      Text(title, style: const TextStyle(color: kText, fontSize: 38, fontWeight: FontWeight.w900, letterSpacing: -1, height: 1)),
      const SizedBox(height: 12),
      Row(children: [
        Container(width: 40, height: 3, decoration: BoxDecoration(color: kAccent,  borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 6),
        Container(width: 14, height: 3, decoration: BoxDecoration(color: kAccent2, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 6),
        Container(width: 7,  height: 3, decoration: BoxDecoration(color: kAccent3, borderRadius: BorderRadius.circular(2))),
      ]),
    ],
  );
}

// ─── HERO ───────────────────────────────────────────────────────
class _HeroSection extends StatefulWidget {
  const _HeroSection({super.key});
  @override State<_HeroSection> createState() => _HeroState();
}
class _HeroState extends State<_HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> _fade, _slide;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1100));
    _fade  = CurvedAnimation(parent: _c, curve: Curves.easeOut);
    _slide = Tween(begin: 50.0, end: 0.0)
        .animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));
    Future.delayed(const Duration(milliseconds: 150), _c.forward);
  }
  @override void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(64, 100, 64, 80),
    child: AnimatedBuilder(
      animation: _c,
      builder: (_, __) => Opacity(
        opacity: _fade.value,
        child: Transform.translate(
          offset: Offset(0, _slide.value),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Badge('● Open to Internships & Full-Time Roles', kAccent),
            const SizedBox(height: 32),
            const Text('Dhivya\nPalraj.',
              style: TextStyle(color: kText, fontSize: 78, fontWeight: FontWeight.w900, height: .94, letterSpacing: -3)),
            const SizedBox(height: 22),
            Row(children: [
              Container(width: 32, height: 2, color: kAccent),
              const SizedBox(width: 12),
              const Text('Software Developer  ·  5 Projects  ·  Full-Stack  ·  AI/ML',
                style: TextStyle(color: kAccent, fontSize: 14, letterSpacing: .8, fontWeight: FontWeight.w300)),
            ]),
            const SizedBox(height: 26),
            const SizedBox(width: 560,
              child: Text(
                'Building AI tools, full-stack applications, and secure systems — '
                'from fake job detectors to online voting platforms.',
                style: TextStyle(color: kMuted, fontSize: 16, height: 1.75))),
            const SizedBox(height: 48),
            Row(children: [
              _PrimaryBtn('→  View Projects', () {}),
              const SizedBox(width: 14),
              _OutlineBtn('↓  Download CV', () {}),
              const SizedBox(width: 14),
              _OutlineBtn('✉  Contact', () => _launchUrl(kEmailUrl)),
            ]),
            const SizedBox(height: 72),
            Row(children: const [
              _Stat('5',  'Projects Built'),
              SizedBox(width: 52),
              _Stat('16', 'Certifications'),
              SizedBox(width: 52),
              _Stat('3',  'Awards'),
              SizedBox(width: 52),
              _Stat('N5', 'JLPT Japanese'),
            ]),
          ]),
        ),
      ),
    ),
  );
}

class _Badge extends StatelessWidget {
  final String text; final Color color;
  const _Badge(this.text, this.color);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
    decoration: BoxDecoration(
      color: color.withOpacity(.07),
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: color.withOpacity(.35)),
    ),
    child: Text(text, style: TextStyle(color: color, fontSize: 12, letterSpacing: 1.2, fontWeight: FontWeight.w600)),
  );
}

class _Stat extends StatelessWidget {
  final String num, label;
  const _Stat(this.num, this.label);
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(num,   style: const TextStyle(color: kAccent, fontSize: 38, fontWeight: FontWeight.w900, letterSpacing: -1)),
    Text(label, style: const TextStyle(color: kMuted,  fontSize: 12, letterSpacing: .5)),
  ]);
}

// ─── BUTTONS ────────────────────────────────────────────────────
class _PrimaryBtn extends StatefulWidget {
  final String label; final VoidCallback onTap;
  const _PrimaryBtn(this.label, this.onTap);
  @override State<_PrimaryBtn> createState() => _PrimaryBtnState();
}
class _PrimaryBtnState extends State<_PrimaryBtn> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        decoration: BoxDecoration(
          color: _h ? kAccent : kAccent.withOpacity(.88),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _h ? [BoxShadow(color: kAccent.withOpacity(.3), blurRadius: 24, spreadRadius: -4)] : [],
        ),
        child: Text(widget.label, style: const TextStyle(color: kBg, fontSize: 14, fontWeight: FontWeight.w800)),
      ),
    ),
  );
}

class _OutlineBtn extends StatefulWidget {
  final String label; final VoidCallback onTap;
  const _OutlineBtn(this.label, this.onTap);
  @override State<_OutlineBtn> createState() => _OutlineBtnState();
}
class _OutlineBtnState extends State<_OutlineBtn> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: _h ? kAccent.withOpacity(.06) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _h ? kAccent.withOpacity(.55) : kBorder, width: 1.5),
        ),
        child: Text(widget.label,
          style: TextStyle(color: _h ? kAccent : kMuted, fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    ),
  );
}

// ─── ABOUT ──────────────────────────────────────────────────────
class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 80),
    color: kSurface.withOpacity(.35),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(flex: 2, child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: kCard, borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kAccent.withOpacity(.15)),
          boxShadow: [BoxShadow(color: kAccent.withOpacity(.05), blurRadius: 40, spreadRadius: -4)],
        ),
        child: Column(children: [
          Container(
            width: 100, height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [kAccent, kAccent2],
                begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const Center(child: Text('DP', style: TextStyle(color: kBg, fontSize: 32, fontWeight: FontWeight.w900))),
          ),
          const SizedBox(height: 18),
          const Text('Dhivya Palraj', style: TextStyle(color: kText, fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          const Text('Software Developer', style: TextStyle(color: kAccent, fontSize: 12, letterSpacing: 1)),
          const SizedBox(height: 20),
          _iRow(Icons.school_outlined,      'BCA · Bharathiar University'),
          _iRow(Icons.location_on_outlined,  'Udumalpet, Tamil Nadu'),
          _iRow(Icons.language_outlined,     'JLPT N5 – Japanese'),
          _iRow(Icons.star_outline_rounded,  'Dept. Secretary 2024–25'),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _SocialChip('GitHub',   Icons.code,        kGithubUrl),
            const SizedBox(width: 10),
            _SocialChip('LinkedIn', Icons.work_outline, kLinkedinUrl),
          ]),
        ]),
      )),
      const SizedBox(width: 56),
      Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _SH(tag: 'about me', title: 'Who I Am'),
        const SizedBox(height: 26),
        const Text(
          'I\'m a final-year BCA student at Bharathiar University who loves building '
          'real-world projects — from AI-powered resume parsers to secure online voting systems. '
          'I enjoy every layer of the stack: frontend design, backend APIs, databases, and AI/ML.',
          style: TextStyle(color: kMuted, fontSize: 15, height: 1.8)),
        const SizedBox(height: 16),
        const Text(
          'I\'ve built 5 projects spanning C#, Python, React.js, Flask, and Node.js — '
          'and I\'m always looking for the next challenge that pushes me to learn something new.',
          style: TextStyle(color: kMuted, fontSize: 15, height: 1.8)),
        const SizedBox(height: 32),
        const Text('Education', style: TextStyle(color: kText, fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 14),
        _EduRow('2023–2026', 'BCA', 'Sree Saraswathi Thyagaraja College, Pollachi', kAccent),
        _EduRow('2022–2023', 'HSC',  'Sri Kannika Parameswari Hr. Sec. School', kAccent2),
        _EduRow('2020–2021', 'SSLC', 'Sri Kannika Parameswari Hr. Sec. School', kAccent3),
      ])),
    ]),
  );

  Widget _iRow(IconData ic, String t) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(children: [
      Icon(ic, color: kAccent, size: 14),
      const SizedBox(width: 10),
      Flexible(child: Text(t, style: const TextStyle(color: kMuted, fontSize: 12))),
    ]),
  );
}

class _EduRow extends StatelessWidget {
  final String year, title, place; final Color color;
  const _EduRow(this.year, this.title, this.place, this.color);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Row(children: [
      Container(width: 4, height: 50, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
      const SizedBox(width: 16),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w700)),
        Text(place, style: const TextStyle(color: kMuted, fontSize: 12)),
        Text(year,  style: const TextStyle(color: kMuted, fontSize: 11)),
      ]),
    ]),
  );
}

class _SocialChip extends StatefulWidget {
  final String label, url; final IconData icon;
  const _SocialChip(this.label, this.icon, this.url);
  @override State<_SocialChip> createState() => _SocialChipState();
}
class _SocialChipState extends State<_SocialChip> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    child: GestureDetector(
      onTap: () => _launchUrl(widget.url),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: _h ? kAccent.withOpacity(.10) : kSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _h ? kAccent.withOpacity(.4) : kBorder),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(widget.icon, color: _h ? kAccent : kMuted, size: 14),
          const SizedBox(width: 6),
          Text(widget.label, style: TextStyle(color: _h ? kAccent : kMuted, fontSize: 12)),
        ]),
      ),
    ),
  );
}

// ─── PROJECTS ───────────────────────────────────────────────────
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 80),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _SH(tag: 'work', title: 'Projects'),
      const SizedBox(height: 8),
      Text('${_projects.length} projects across Frontend, Backend, AI/ML & Full-Stack',
        style: const TextStyle(color: kMuted, fontSize: 14)),
      const SizedBox(height: 44),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: _ProjectCard(_projects[0])),
        const SizedBox(width: 20),
        Expanded(child: _ProjectCard(_projects[1])),
        const SizedBox(width: 20),
        Expanded(child: _ProjectCard(_projects[2])),
      ]),
      const SizedBox(height: 20),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: _ProjectCard(_projects[3])),
        const SizedBox(width: 20),
        Expanded(child: _ProjectCard(_projects[4])),
        const SizedBox(width: 20),
        const Expanded(child: SizedBox()),
      ]),
    ]),
  );
}

class _ProjectCard extends StatefulWidget {
  final Map data;
  const _ProjectCard(this.data);
  @override State<_ProjectCard> createState() => _ProjectCardState();
}
class _ProjectCardState extends State<_ProjectCard> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final color = widget.data['color'] as Color;
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit:  (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: _h ? (Matrix4.identity()..translate(0.0, -7.0)) : Matrix4.identity(),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: _h ? kCard : kSurface.withOpacity(.45),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: _h ? color.withOpacity(.45) : kBorder, width: 1.5),
            boxShadow: _h ? [BoxShadow(color: color.withOpacity(.13), blurRadius: 36, spreadRadius: -4)] : [],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(widget.data['emoji'] as String, style: const TextStyle(fontSize: 34)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(.08),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color.withOpacity(.25)),
                ),
                child: Text(widget.data['tag'] as String,
                  style: TextStyle(color: color, fontSize: 10, letterSpacing: .3)),
              ),
            ]),
            const SizedBox(height: 16),
            Text(widget.data['title'] as String,
              style: const TextStyle(color: kText, fontSize: 17, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            Text(widget.data['desc'] as String,
              style: const TextStyle(color: kMuted, fontSize: 13, height: 1.65)),
            const SizedBox(height: 16),
            Wrap(spacing: 6, runSpacing: 6,
              children: (widget.data['tech'] as List<String>).map((t) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withOpacity(.07),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: color.withOpacity(.2)),
                ),
                child: Text(t, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700)),
              )).toList()),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kBg, borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kBorder),
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('💡 ', style: TextStyle(fontSize: 12)),
                Expanded(child: Text(widget.data['learn'] as String,
                  style: const TextStyle(color: kMuted, fontSize: 11, height: 1.5))),
              ]),
            ),
            const SizedBox(height: 20),
            Row(children: [
              _Link('⌥  Code', color),
              const SizedBox(width: 20),
              _Link('↗  Demo', kMuted),
            ]),
          ]),
        ),
      ),
    );
  }
}

class _Link extends StatefulWidget {
  final String label; final Color color;
  const _Link(this.label, this.color);
  @override State<_Link> createState() => _LinkState();
}
class _LinkState extends State<_Link> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    child: GestureDetector(
      onTap: () {},
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 150),
        style: TextStyle(
          color: _h ? kAccent : widget.color,
          fontSize: 13, fontWeight: FontWeight.w700,
          decoration: _h ? TextDecoration.underline : TextDecoration.none,
          decorationColor: kAccent,
          fontFamily: 'Courier',
        ),
        child: Text(widget.label),
      ),
    ),
  );
}

// ─── SKILLS ─────────────────────────────────────────────────────
class _SkillsSection extends StatelessWidget {
  const _SkillsSection({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 80),
    color: kSurface.withOpacity(.35),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _SH(tag: 'expertise', title: 'Skills'),
      const SizedBox(height: 44),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 32,
          mainAxisSpacing: 22, childAspectRatio: 6,
        ),
        itemCount: _skills.length,
        itemBuilder: (_, i) => _SkillBar(
          name:  _skills[i]['name']  as String,
          pct:   _skills[i]['pct']   as int,
          color: _skills[i]['color'] as Color,
          delay: Duration(milliseconds: 200 + i * 70),
        ),
      ),
      const SizedBox(height: 60),
      // ─── CERTIFICATIONS HEADER ───────────────────────────────
      const Text('Certifications',
        style: TextStyle(color: kText, fontSize: 22, fontWeight: FontWeight.w800)),
      const SizedBox(height: 6),
      Text('${_certs.length} certificates across 6 platforms',
        style: const TextStyle(color: kMuted, fontSize: 13)),
      const SizedBox(height: 28),
      // ─── INFOSYS GROUP ───────────────────────────────────────
      _CertGroupHeader('Infosys Springboard', '9', kAccent),
      const SizedBox(height: 14),
      _CertRow(_certs.where((c) => c['by'] == 'Infosys Springboard').toList()),
      const SizedBox(height: 28),
      // ─── NPTEL GROUP ─────────────────────────────────────────
      _CertGroupHeader('NPTEL', '2', kAccent2),
      const SizedBox(height: 14),
      _CertRow(_certs.where((c) => c['by'] == 'NPTEL').toList()),
      const SizedBox(height: 28),
      // ─── OTHER PLATFORMS ─────────────────────────────────────
      _CertGroupHeader('Other Platforms', '5', kAccent3),
      const SizedBox(height: 14),
      _CertRow(_certs.where((c) => c['by'] != 'Infosys Springboard' && c['by'] != 'NPTEL').toList()),
    ]),
  );
}

class _CertGroupHeader extends StatelessWidget {
  final String title, count; final Color color;
  const _CertGroupHeader(this.title, this.count, this.color);
  @override
  Widget build(BuildContext context) => Row(children: [
    Container(width: 3, height: 18, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
    const SizedBox(width: 12),
    Text(title, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: .5)),
    const SizedBox(width: 10),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(.3)),
      ),
      child: Text(count, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700)),
    ),
  ]);
}

class _CertRow extends StatelessWidget {
  final List certs;
  const _CertRow(this.certs);
  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 14,
    runSpacing: 14,
    children: certs.map((c) => _CertCard(
      c['icon'] as String,
      c['name'] as String,
      c['by']   as String,
      c['color'] as Color,
    )).toList(),
  );
}

class _SkillBar extends StatefulWidget {
  final String name; final int pct; final Color color; final Duration delay;
  const _SkillBar({required this.name, required this.pct, required this.color, required this.delay});
  @override State<_SkillBar> createState() => _SkillBarState();
}
class _SkillBarState extends State<_SkillBar> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> _a;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _a = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    Future.delayed(widget.delay, () { if (mounted) _c.forward(); });
  }
  @override void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(widget.name, style: const TextStyle(color: kText, fontSize: 13, fontWeight: FontWeight.w600)),
        AnimatedBuilder(animation: _a, builder: (_, __) =>
          Text('${(widget.pct * _a.value).round()}%',
            style: TextStyle(color: widget.color, fontSize: 12, fontWeight: FontWeight.w700))),
      ]),
      const SizedBox(height: 7),
      Stack(children: [
        Container(height: 5, decoration: BoxDecoration(color: kCard, borderRadius: BorderRadius.circular(3))),
        AnimatedBuilder(animation: _a, builder: (_, __) =>
          FractionallySizedBox(
            widthFactor: widget.pct / 100 * _a.value,
            child: Container(height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: LinearGradient(colors: [widget.color.withOpacity(.7), widget.color]),
                boxShadow: [BoxShadow(color: widget.color.withOpacity(.35), blurRadius: 8)],
              )),
          )),
      ]),
    ],
  );
}

class _CertCard extends StatefulWidget {
  final String icon, name, by; final Color color;
  const _CertCard(this.icon, this.name, this.by, this.color);
  @override State<_CertCard> createState() => _CertCardState();
}
class _CertCardState extends State<_CertCard> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 190,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _h ? kCard : kSurface.withOpacity(.5),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _h ? widget.color.withOpacity(.4) : kBorder),
        boxShadow: _h ? [BoxShadow(color: widget.color.withOpacity(.10), blurRadius: 20)] : [],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.icon, style: const TextStyle(fontSize: 26)),
        const SizedBox(height: 10),
        Text(widget.name,
          style: TextStyle(color: _h ? kText : kText.withOpacity(.85), fontSize: 13, fontWeight: FontWeight.w700),
          maxLines: 2, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
        Text(widget.by,
          style: TextStyle(color: _h ? widget.color : kMuted, fontSize: 11, fontWeight: FontWeight.w500)),
      ]),
    ),
  );
}

// ─── AWARDS ─────────────────────────────────────────────────────
class _AwardsSection extends StatelessWidget {
  const _AwardsSection({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 80),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _SH(tag: 'recognition', title: 'Awards'),
      const SizedBox(height: 40),
      ..._awards.map((a) => _AwardRow(a)),
    ]),
  );
}

class _AwardRow extends StatefulWidget {
  final String text;
  const _AwardRow(this.text);
  @override State<_AwardRow> createState() => _AwardRowState();
}
class _AwardRowState extends State<_AwardRow> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: _h ? kCard : kSurface.withOpacity(.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _h ? kAccent.withOpacity(.3) : kBorder),
      ),
      child: Row(children: [
        Container(width: 3, height: 24, decoration: BoxDecoration(color: kAccent, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 18),
        Text(widget.text, style: TextStyle(color: _h ? kText : kMuted, fontSize: 15, fontWeight: FontWeight.w500)),
      ]),
    ),
  );
}

// ─── CONTACT ────────────────────────────────────────────────────
class _ContactSection extends StatelessWidget {
  const _ContactSection({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 80),
    color: kSurface.withOpacity(.35),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _SH(tag: "let's connect", title: 'Contact'),
      const SizedBox(height: 48),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // ─── LEFT: Contact Info ──────────────────────────────
        Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Get In Touch',
            style: TextStyle(color: kText, fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          const Text(
            'I\'m actively looking for internships and full-time opportunities.\n'
            'Have a project, role, or just want to say hi? My inbox is always open!',
            style: TextStyle(color: kMuted, fontSize: 14, height: 1.7)),
          const SizedBox(height: 32),
          _CRow(Icons.email_outlined,      'Email',    'dhivya032005@gmail.com'),
          _CRow(Icons.phone_outlined,       'Phone',    '+91 6369 372 912'),
          _CRow(Icons.location_on_outlined, 'Location', 'Udumalpet, Tamil Nadu, India'),
          const SizedBox(height: 36),
          // ─── Social Link Buttons ─────────────────────────
          const Text('Find Me On',
            style: TextStyle(color: kMuted, fontSize: 12, letterSpacing: 1.5, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Row(children: [
            _SocialLinkBtn(
              label: 'GitHub',
              sublabel: 'itzz-dhivya',
              icon: Icons.code_rounded,
              color: kAccent,
              url: kGithubUrl,
            ),
            const SizedBox(width: 16),
            _SocialLinkBtn(
              label: 'LinkedIn',
              sublabel: 'dhivya003',
              icon: Icons.work_outline_rounded,
              color: kAccent2,
              url: kLinkedinUrl,
            ),
            const SizedBox(width: 16),
            _SocialLinkBtn(
              label: 'Email',
              sublabel: 'dhivya032005@gmail.com',
              icon: Icons.email_outlined,
              color: kAccent3,
              url: kEmailUrl,
            ),
          ]),
        ])),
        const SizedBox(width: 80),
        // ─── RIGHT: Quick Stats Card ─────────────────────────
        Expanded(flex: 2, child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: kCard, borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kBorder),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Quick Facts',
              style: TextStyle(color: kText, fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 24),
            _FactRow('📍', 'Location', 'Udumalpet, Tamil Nadu'),
            _FactRow('🎓', 'Degree',   'BCA – Bharathiar University'),
            _FactRow('💼', 'Status',   'Open to Opportunities'),
            _FactRow('🌐', 'Languages','Tamil, English, Japanese (N5)'),
            _FactRow('⚡', 'Stack',    'Full-Stack + AI/ML'),
            _FactRow('📅', 'Grad Year','2026'),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kAccent.withOpacity(.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kAccent.withOpacity(.2)),
              ),
              child: Column(children: [
                const Text('Response Time', style: TextStyle(color: kMuted, fontSize: 11, letterSpacing: 1)),
                const SizedBox(height: 6),
                const Text('< 24 hours', style: TextStyle(color: kAccent, fontSize: 20, fontWeight: FontWeight.w900)),
              ]),
            ),
          ]),
        )),
      ]),
    ]),
  );
}

class _FactRow extends StatelessWidget {
  final String emoji, label, value;
  const _FactRow(this.emoji, this.label, this.value);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Row(children: [
      Text(emoji, style: const TextStyle(fontSize: 14)),
      const SizedBox(width: 12),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(color: kMuted, fontSize: 10, letterSpacing: .8)),
        Text(value,  style: const TextStyle(color: kText,  fontSize: 13, fontWeight: FontWeight.w600)),
      ]),
    ]),
  );
}

class _SocialLinkBtn extends StatefulWidget {
  final String label, sublabel, url; final IconData icon; final Color color;
  const _SocialLinkBtn({required this.label, required this.sublabel, required this.icon, required this.color, required this.url});
  @override State<_SocialLinkBtn> createState() => _SocialLinkBtnState();
}
class _SocialLinkBtnState extends State<_SocialLinkBtn> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    child: GestureDetector(
      onTap: () => _launchUrl(widget.url),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: _h ? widget.color.withOpacity(.10) : kCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _h ? widget.color.withOpacity(.5) : kBorder, width: 1.5),
          boxShadow: _h ? [BoxShadow(color: widget.color.withOpacity(.15), blurRadius: 24, spreadRadius: -4)] : [],
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 38, height: 38,
            decoration: BoxDecoration(
              color: widget.color.withOpacity(.10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: widget.color.withOpacity(.25)),
            ),
            child: Icon(widget.icon, color: widget.color, size: 18),
          ),
          const SizedBox(width: 14),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.label,
              style: TextStyle(color: _h ? widget.color : kText, fontSize: 14, fontWeight: FontWeight.w700)),
            Text(widget.sublabel,
              style: const TextStyle(color: kMuted, fontSize: 11)),
          ]),
          const SizedBox(width: 10),
          Icon(Icons.arrow_outward_rounded, color: _h ? widget.color : kMuted, size: 14),
        ]),
      ),
    ),
  );
}

class _CRow extends StatelessWidget {
  final IconData icon; final String label, value;
  const _CRow(this.icon, this.label, this.value);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 18),
    child: Row(children: [
      Container(
        width: 42, height: 42,
        decoration: BoxDecoration(
          color: kAccent.withOpacity(.07), borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kAccent.withOpacity(.2))),
        child: Icon(icon, color: kAccent, size: 18)),
      const SizedBox(width: 16),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(color: kMuted, fontSize: 11, letterSpacing: 1)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(color: kText, fontSize: 14, fontWeight: FontWeight.w600)),
      ]),
    ]),
  );
}

// ─── FOOTER ─────────────────────────────────────────────────────
class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
    decoration: const BoxDecoration(border: Border(top: BorderSide(color: kBorder))),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text('© 2025 Dhivya Palraj · Built with Flutter',
        style: TextStyle(color: kMuted, fontSize: 12)),
      Row(children: [
        _FooterLink('GitHub',   kGithubUrl),
        const SizedBox(width: 24),
        _FooterLink('LinkedIn', kLinkedinUrl),
        const SizedBox(width: 24),
        _FooterLink('Email',    kEmailUrl),
      ]),
      const Text('Made with ❤️ in Tamil Nadu',
        style: TextStyle(color: kMuted, fontSize: 12)),
    ]),
  );
}

class _FooterLink extends StatefulWidget {
  final String label, url;
  const _FooterLink(this.label, this.url);
  @override State<_FooterLink> createState() => _FooterLinkState();
}
class _FooterLinkState extends State<_FooterLink> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    child: GestureDetector(
      onTap: () => _launchUrl(widget.url),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 150),
        style: TextStyle(
          color: _h ? kAccent : kMuted,
          fontSize: 12,
          decoration: _h ? TextDecoration.underline : TextDecoration.none,
          decorationColor: kAccent,
          fontFamily: 'Courier',
        ),
        child: Text(widget.label),
      ),
    ),
  );
}
