import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'link_launcher.dart';

const _emailAddress = 'qqjamous12@gmail.com';
const _cvAssetUrl = 'assets/assets/cv/qusai_jamous_flutter_developer_cv.pdf';
const _profileImageAsset = 'assets/images/qusai_jamous_profile.jpeg';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF151719);
    const paper = Color(0xFFF7F3EA);
    const moss = Color(0xFF6F7F52);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qusai Jamous Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: moss,
          brightness: Brightness.light,
          surface: paper,
        ),
        scaffoldBackgroundColor: paper,
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: ink,
          displayColor: ink,
          fontFamily: 'Roboto',
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  static const _projects = [
    Project(
      title: 'E-Commerce Applications',
      description:
          'Production shopping experiences with polished product flows, cart logic, checkout journeys, and scalable app structure.',
      tags: ['Flutter', 'GetX', 'Payments'],
      icon: Icons.storefront,
    ),
    Project(
      title: 'Payment Integrations',
      description:
          'Integrated payment gateways including ClickPay and HyperPay for secure mobile checkout experiences.',
      tags: ['ClickPay', 'HyperPay', 'APIs'],
      icon: Icons.payments_outlined,
    ),
    Project(
      title: 'Maps & Google Services',
      description:
          'Built app features using Google Maps, Firebase, Google sign-in, and other Google service integrations.',
      tags: ['Google Maps', 'Firebase', 'Auth'],
      icon: Icons.map_outlined,
    ),
  ];

  static const _skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'Google Maps',
    'Google Sign-In',
    'ClickPay',
    'HyperPay',
    'REST APIs',
    'GetX',
    'BLoC',
    'Riverpod',
    'Git',
    'Clean Architecture',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: _NavBar()),
            SliverToBoxAdapter(
              child: _PageSection(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 860;
                    final hero = const _HeroIntro();
                    final panel = const _HeroPanel();

                    if (!isWide) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [hero, const SizedBox(height: 28), panel],
                      );
                    }

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 11, child: hero),
                        const SizedBox(width: 48),
                        Expanded(flex: 9, child: panel),
                      ],
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _PageSection(
                topPadding: 32,
                child: _SectionHeader(
                  eyebrow: 'Selected work',
                  title: 'Mobile app work shaped for real users and stores.',
                  description:
                      'A snapshot of the kinds of Flutter applications and integrations I have worked on professionally.',
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.crossAxisExtent;
                  final count = width > 1050
                      ? 3
                      : width > 680
                      ? 2
                      : 1;

                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          _ProjectCard(project: _projects[index]),
                      childCount: _projects.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: count,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      childAspectRatio: count == 1 ? 1.25 : 0.92,
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: _PageSection(
                topPadding: 24,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 820;
                    final skills = _SkillCloud(skills: _skills);
                    final experience = const _ExperienceBlock();

                    if (!isWide) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          skills,
                          const SizedBox(height: 24),
                          experience,
                        ],
                      );
                    }

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: skills),
                        const SizedBox(width: 36),
                        Expanded(child: experience),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: _ContactBand()),
          ],
        ),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 6),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF151719),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'QJ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 0,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Qusai Jamous',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          _IconAction(
            icon: Icons.mail_outline,
            label: 'Email',
            onPressed: () => _contactByEmail(context),
          ),
          const SizedBox(width: 8),
          _IconAction(
            icon: Icons.description_outlined,
            label: 'CV',
            onPressed: () => _openCv(context),
          ),
        ],
      ),
    );
  }
}

class _HeroIntro extends StatelessWidget {
  const _HeroIntro();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusPill(
          text: 'Flutter Developer at Token Masters since 2024',
        ),
        const SizedBox(height: 22),
        Text(
          'Flutter developer building production mobile apps.',
          style: TextStyle(
            fontSize: _responsiveTitle(context),
            height: 1.02,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'I am Qusai Adnan Zahran Jamous, a Flutter developer with two years of experience building published apps for the App Store and Google Play. I work with clean architecture, state management, payment integrations, maps, Firebase, and Google services.',
          style: TextStyle(
            fontSize: 18,
            height: 1.55,
            color: Color(0xFF4D5255),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () => _contactByEmail(context),
              icon: const Icon(Icons.mail_outline),
              label: const Text('Contact Me'),
              style: FilledButton.styleFrom(
                minimumSize: const Size(142, 50),
                backgroundColor: const Color(0xFF151719),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => _openCv(context),
              icon: const Icon(Icons.description_outlined),
              label: const Text('My CV'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(132, 50),
                foregroundColor: const Color(0xFF151719),
                side: const BorderSide(color: Color(0xFF151719)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  double _responsiveTitle(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 390) return 40;
    if (width < 680) return 48;
    return 66;
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).width > 860 ? 520 : 460,
      decoration: BoxDecoration(
        color: const Color(0xFF151719),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              _profileImageAsset,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF151719).withValues(alpha: 0.28),
                    const Color(0xFF151719).withValues(alpha: 0.92),
                  ],
                  stops: const [0.34, 0.62, 1],
                ),
              ),
            ),
          ),
          Positioned(
            left: 28,
            right: 28,
            bottom: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _StatusPill(text: 'Available for Flutter projects'),
                const SizedBox(height: 20),
                const Text(
                  'Qusai Jamous',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    height: 1.1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Flutter Developer with a production mindset for clean, reliable mobile app experiences.',
                  style: TextStyle(
                    color: Color(0xFFD9DED6),
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.eyebrow,
    required this.title,
    required this.description,
  });

  final String eyebrow;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF6F7F52),
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 36,
              height: 1.15,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 660),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.55,
              color: Color(0xFF5E6265),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE4DED2)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 22,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFFE9E2D3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(project.icon, color: const Color(0xFF151719)),
          ),
          const Spacer(),
          Text(
            project.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            project.description,
            style: const TextStyle(height: 1.45, color: Color(0xFF5E6265)),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final tag in project.tags) _Tag(text: tag)],
          ),
        ],
      ),
    );
  }
}

class _SkillCloud extends StatelessWidget {
  const _SkillCloud({required this.skills});

  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader(
          eyebrow: 'Toolkit',
          title: 'Skills that make apps feel finished.',
          description:
              'A practical toolkit for building maintainable apps with clean architecture, smooth integrations, and reliable state management.',
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [for (final skill in skills) _SkillChip(text: skill)],
        ),
      ],
    );
  }
}

class _ExperienceBlock extends StatelessWidget {
  const _ExperienceBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E2D3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          SizedBox(height: 18),
          _TimelineItem(
            date: '2024 - Now',
            title: 'Flutter Developer, Token Masters',
            detail:
                'Building and maintaining Flutter applications, including published apps on the App Store and Google Play.',
          ),
          _TimelineItem(
            date: 'Apps',
            title: 'Production mobile features',
            detail:
                'Delivered e-commerce flows, payment integrations, Google Maps features, Firebase services, and Google authentication.',
          ),
          _TimelineItem(
            date: 'Code',
            title: 'Clean architecture and state',
            detail:
                'Writing structured Flutter code using GetX, BLoC, Riverpod, and maintainable architecture patterns.',
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.date,
    required this.title,
    required this.detail,
  });

  final String date;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 58,
            child: Text(
              date,
              style: const TextStyle(
                color: Color(0xFF6F7F52),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  style: const TextStyle(
                    color: Color(0xFF5E6265),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactBand extends StatelessWidget {
  const _ContactBand();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 44, 24, 28),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF151719),
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 720;
          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Let us build a reliable Flutter app.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  height: 1.1,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email: qqjamous12@gmail.com   |   LinkedIn: linkedin.com/in/qusai-jamous-12a03a272   |   GitHub: github.com',
                style: TextStyle(color: Color(0xFFD9DED6), height: 1.5),
              ),
            ],
          );
          final action = FilledButton.icon(
            onPressed: () => _contactByEmail(context),
            icon: const Icon(Icons.send_outlined),
            label: const Text('Contact Me'),
            style: FilledButton.styleFrom(
              minimumSize: const Size(150, 50),
              backgroundColor: const Color(0xFFB8C48A),
              foregroundColor: const Color(0xFF151719),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );

          if (!isWide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [content, const SizedBox(height: 22), action],
            );
          }

          return Row(
            children: [
              Expanded(child: content),
              const SizedBox(width: 28),
              action,
            ],
          );
        },
      ),
    );
  }
}

Future<void> _contactByEmail(BuildContext context) async {
  final opened = await openExternalLink('mailto:$_emailAddress');
  if (opened || !context.mounted) return;

  await Clipboard.setData(const ClipboardData(text: _emailAddress));
  if (!context.mounted) return;
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(const SnackBar(content: Text('Email copied: $_emailAddress')));
}

Future<void> _openCv(BuildContext context) async {
  final opened = await openExternalLink(_cvAssetUrl);
  if (opened || !context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'CV added at assets/cv/qusai_jamous_flutter_developer_cv.pdf',
      ),
    ),
  );
}

class _PageSection extends StatelessWidget {
  const _PageSection({required this.child, this.topPadding = 64});

  final Widget child;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, topPadding, 24, 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: child,
        ),
      ),
    );
  }
}

class _IconAction extends StatelessWidget {
  const _IconAction({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: IconButton.outlined(
        onPressed: onPressed,
        icon: Icon(icon),
        style: IconButton.styleFrom(
          fixedSize: const Size(44, 44),
          foregroundColor: const Color(0xFF151719),
          side: const BorderSide(color: Color(0xFFD6CDBC)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E2D3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF4D573A),
          fontWeight: FontWeight.w800,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE4DED2)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE4DED2)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w800)),
    );
  }
}

class Project {
  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.icon,
  });

  final String title;
  final String description;
  final List<String> tags;
  final IconData icon;
}
