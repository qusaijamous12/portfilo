import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'link_launcher.dart';

const _name = 'Qusai Jamous';
const _emailAddress = 'qqjamous12@gmail.com';
const _phoneNumber = 'Available on CV';
const _linkedinUrl = 'https://www.linkedin.com/in/qusai-jamous-12a03a272';
const _githubUrl = 'https://github.com';
const _whatsAppUrl = 'https://wa.me/';
const _cvAssetUrl = 'assets/assets/cv/qusai_jamous_flutter_developer_cv.pdf';
const _profileImageAsset = 'assets/images/qusai_jamous_profile.jpeg';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF080B12);
    const surface = Color(0xFF111827);
    const accent = Color(0xFF34D399);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qusai Jamous | Flutter Mobile Application Developer',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.dark,
          surface: surface,
        ),
        fontFamily: 'Roboto',
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          fontFamily: 'Roboto',
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  static const _skills = [
    SkillGroup('Languages', ['Dart', 'Java', 'Kotlin'], Icons.code),
    SkillGroup('Frameworks', ['Flutter'], Icons.flutter_dash),
    SkillGroup('State Management', [
      'Bloc',
      'Cubit',
      'Provider',
      'GetX',
      'Riverpod',
    ], Icons.account_tree_outlined),
    SkillGroup('Backend', [
      'Firebase',
      'REST APIs',
      'Socket.IO',
    ], Icons.cloud_outlined),
    SkillGroup('Firebase', [
      'Authentication',
      'Firestore',
      'Cloud Messaging',
      'Storage',
      'Analytics',
      'Crashlytics',
    ], Icons.local_fire_department_outlined),
    SkillGroup('Payments', ['HyperPay', 'ClickPay'], Icons.payments_outlined),
    SkillGroup('Maps', [
      'Google Maps',
      'Location Services',
    ], Icons.map_outlined),
    SkillGroup('Architecture', [
      'Clean Architecture',
      'Repository Pattern',
      'SOLID Principles',
      'MVVM',
    ], Icons.foundation_outlined),
    SkillGroup('Tools', [
      'Git',
      'GitHub',
      'Android Studio',
      'VS Code',
      'Postman',
      'Figma',
    ], Icons.construction_outlined),
  ];

  static const _projects = [
    Project(
      title: 'E-commerce App',
      summary:
          'A scalable shopping experience built for smooth product discovery, checkout, payments, orders, and customer notifications.',
      problem:
          'Help customers move from browsing to checkout with fewer friction points while keeping the codebase maintainable.',
      features: [
        'Authentication',
        'Cart',
        'Orders',
        'Payments',
        'Notifications',
      ],
      technologies: ['Flutter', 'REST APIs', 'Firebase', 'HyperPay'],
      icon: Icons.shopping_bag_outlined,
      accent: Color(0xFF38BDF8),
    ),
    Project(
      title: 'eSIM App',
      summary:
          'A mobile eSIM purchase and activation flow with secure payment integration and clear activation guidance.',
      problem:
          'Make purchasing and activating a digital SIM feel simple, reliable, and understandable for mobile users.',
      features: ['Purchase eSIM', 'QR Activation', 'Payment Integration'],
      technologies: ['Flutter', 'ClickPay', 'QR Flow', 'Clean Architecture'],
      icon: Icons.sim_card_outlined,
      accent: Color(0xFFF59E0B),
    ),
    Project(
      title: 'Real-time Chat',
      summary:
          'A responsive real-time communication experience with instant messages, notifications, and reliable sync.',
      problem:
          'Support fast user-to-user messaging while keeping conversations updated across app sessions.',
      features: ['Firebase', 'Socket.IO', 'Push Notifications'],
      technologies: ['Flutter', 'Firebase', 'Socket.IO', 'FCM'],
      icon: Icons.forum_outlined,
      accent: Color(0xFFA78BFA),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _Background(),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: _NavBar()),
                const SliverToBoxAdapter(child: _HeroSection()),
                const SliverToBoxAdapter(child: _RecruiterSnapshot()),
                const SliverToBoxAdapter(child: _AboutSection()),
                const SliverToBoxAdapter(child: _ExperienceSection()),
                SliverToBoxAdapter(child: _SkillsSection(groups: _skills)),
                SliverToBoxAdapter(
                  child: _ProjectsSection(projects: _projects),
                ),
                //   const SliverToBoxAdapter(child: _SocialProofSection()),
                // const SliverToBoxAdapter(child: _ContactSection()),
                // const SliverToBoxAdapter(child: SizedBox(height: 34)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF080B12), Color(0xFF0D1320), Color(0xFF111827)],
        ),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar();

  @override
  Widget build(BuildContext context) {
    return _PageSection(
      verticalPadding: 18,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            ),
            child: const Text(
              'QJ',
              style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 0),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                Text(
                  'Flutter Mobile Developer',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
                ),
              ],
            ),
          ),
          _RoundIconButton(
            icon: Icons.mail_outline,
            label: 'Contact',
            onPressed: () => _contactByEmail(context),
          ),
          const SizedBox(width: 8),
          _RoundIconButton(
            icon: Icons.description_outlined,
            label: 'Download CV',
            onPressed: () => _openCv(context),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return _Reveal(
      child: _PageSection(
        verticalPadding: 44,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 920;
            final content = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _StatusPill(text: '2+ years building production apps'),
                const SizedBox(height: 22),
                Text(
                  'Flutter Mobile Application Developer',
                  style: TextStyle(
                    fontSize: _heroTitleSize(context),
                    height: 1.02,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Building scalable, high-performance cross-platform applications with Flutter.',
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.35,
                    color: Color(0xFFD1D5DB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'I have 2+ years of experience developing production-ready Flutter applications, including E-commerce, eSIM, and Real-Time applications. I focus on clean architecture, maintainable code, and exceptional user experience.',
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.65,
                    color: Color(0xFFAEB7C2),
                  ),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _PrimaryButton(
                      icon: Icons.download_outlined,
                      label: 'Download CV',
                      onPressed: () => _openCv(context),
                    ),
                    _SecondaryButton(
                      icon: Icons.mail_outline,
                      label: 'Contact Me',
                      onPressed: () => _contactByEmail(context),
                    ),
                  ],
                ),
              ],
            );

            final panel = const _HeroProfilePanel();
            if (!isWide) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [content, const SizedBox(height: 30), panel],
              );
            }

            return Row(
              children: [
                Expanded(flex: 11, child: content),
                const SizedBox(width: 46),
                Expanded(flex: 8, child: panel),
              ],
            );
          },
        ),
      ),
    );
  }

  double _heroTitleSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 380) return 38;
    if (width < 680) return 46;
    return 68;
  }
}

class _HeroProfilePanel extends StatelessWidget {
  const _HeroProfilePanel();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                _profileImageAsset,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.medium,
                errorBuilder: (_, _, _) => const ColoredBox(
                  color: Color(0xFF1F2937),
                  child: Icon(Icons.person_outline, size: 84),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Production-ready Flutter applications for commerce, telecom, delivery, and real-time experiences.',
            style: TextStyle(
              fontSize: 18,
              height: 1.45,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _MetricPill(value: '2+', label: 'Years'),
              _MetricPill(value: '3+', label: 'Industries'),
              _MetricPill(value: '10+', label: 'Integrations'),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecruiterSnapshot extends StatelessWidget {
  const _RecruiterSnapshot();

  @override
  Widget build(BuildContext context) {
    const items = [
      _SnapshotItem('Role', 'Flutter Mobile Developer', Icons.work_outline),
      _SnapshotItem('Experience', '2+ years', Icons.verified_outlined),
      _SnapshotItem(
        'Industries',
        'E-commerce, eSIM, Real-time',
        Icons.category_outlined,
      ),
      _SnapshotItem(
        'Strengths',
        'Clean Architecture, Firebase, Payments',
        Icons.bolt_outlined,
      ),
    ];

    return _PageSection(
      verticalPadding: 18,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth > 920 ? 4 : 2;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisExtent: 128,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) => _InfoTile(item: items[index]),
          );
        },
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return const _Reveal(
      delay: Duration(milliseconds: 120),
      child: _PageSection(
        child: _GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionHeader(
                eyebrow: 'About Me',
                title: 'A mobile developer focused on products that ship.',
                description:
                    'I am a Flutter Mobile Application Developer with more than two years of experience building high-quality mobile applications.\n\nI have worked on multiple production applications including E-commerce platforms, eSIM applications, delivery systems, and real-time applications.\n\nMy expertise includes payment gateway integration (HyperPay, ClickPay), Firebase services, Socket.IO, Google Maps, push notifications, REST APIs, state management, and clean architecture.\n\nI enjoy building scalable applications with clean, maintainable code while delivering excellent user experiences.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection();

  @override
  Widget build(BuildContext context) {
    const highlights = [
      '2+ Years Experience',
      'Production Applications',
      'E-commerce Apps',
      'eSIM Platform',
      'Payment Integrations',
      'Firebase',
      'Real-time Applications',
      'REST APIs',
      'Google Maps',
      'Push Notifications',
      'CI/CD',
      'Clean Architecture',
      'State Management',
      'Responsive UI',
    ];

    return _Reveal(
      delay: const Duration(milliseconds: 180),
      child: _PageSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              eyebrow: 'Experience',
              title: 'Flutter Mobile Developer',
              description:
                  'Professional experience building, integrating, and maintaining mobile applications for real production workflows.',
            ),
            const SizedBox(height: 20),
            _GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _IconBadge(icon: Icons.phone_android_outlined),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Text(
                          'Mobile application delivery across product, integration, and user experience layers.',
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.45,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final item in highlights) _SkillChip(text: item),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection({required this.groups});

  final List<SkillGroup> groups;

  @override
  Widget build(BuildContext context) {
    return _Reveal(
      delay: const Duration(milliseconds: 240),
      child: _PageSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              eyebrow: 'Skills',
              title: 'A toolkit for reliable Flutter products.',
              description:
                  'Grouped by the areas recruiters and engineering teams usually scan first.',
            ),
            const SizedBox(height: 22),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth > 1040
                    ? 3
                    : constraints.maxWidth > 680
                    ? 2
                    : 1;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: groups.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisExtent: 210,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) =>
                      _SkillGroupCard(group: groups[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return _Reveal(
      delay: const Duration(milliseconds: 300),
      child: _PageSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              eyebrow: 'Projects',
              title: 'Strongest work for a recruiter scan.',
              description:
                  'Each project highlights the problem solved, core features, and technologies used.',
            ),
            const SizedBox(height: 22),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 980;
                return Column(
                  children: [
                    for (final project in projects) ...[
                      _ProjectCard(project: project, horizontal: isWide),
                      const SizedBox(height: 18),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialProofSection extends StatelessWidget {
  const _SocialProofSection();

  @override
  Widget build(BuildContext context) {
    return _Reveal(
      delay: const Duration(milliseconds: 360),
      child: _PageSection(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 860;
            if (!isWide) {
              return const Column(
                children: [
                  _GitHubCard(),
                  // SizedBox(height: 16),
                  // _LinkedInCard(),
                ],
              );
            }
            return const Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _GitHubCard()),
                SizedBox(width: 16),
                Expanded(child: _LinkedInCard()),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _GitHubCard extends StatelessWidget {
  const _GitHubCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(
            icon: Icons.hub_outlined,
            title: 'GitHub',
            subtitle: 'Profile, repositories, and contribution activity',
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _MetricPill(value: 'Live', label: 'Profile'),
              _MetricPill(value: 'View', label: 'Followers'),
              _MetricPill(value: 'View', label: 'Public repos'),
            ],
          ),
          const SizedBox(height: 18),
          const _ContributionGraph(),
          const SizedBox(height: 18),
          const Text(
            'Top repositories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _SkillChip(text: 'Flutter apps'),
              _SkillChip(text: 'Firebase integrations'),
              _SkillChip(text: 'Payment flows'),
            ],
          ),
          const SizedBox(height: 20),
          _SecondaryButton(
            icon: Icons.open_in_new,
            label: 'Open GitHub Profile',
            onPressed: () => _openUrl(context, _githubUrl),
          ),
        ],
      ),
    );
  }
}

class _LinkedInCard extends StatelessWidget {
  const _LinkedInCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(
            icon: Icons.business_center_outlined,
            title: 'LinkedIn',
            subtitle: 'Professional profile and recruiter contact',
          ),
          const SizedBox(height: 18),
          const Text(
            'Let us connect if you are hiring for Flutter, mobile, or cross-platform application roles.',
            style: TextStyle(
              color: Color(0xFFC8D1DC),
              height: 1.55,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 26),
          _PrimaryButton(
            icon: Icons.person_add_alt_1_outlined,
            label: 'Connect on LinkedIn',
            onPressed: () => _openUrl(context, _linkedinUrl),
          ),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return _Reveal(
      delay: const Duration(milliseconds: 420),
      child: _PageSection(
        child: _GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                eyebrow: 'Contact',
                title: 'Ready to build production Flutter apps.',
                description:
                    'For recruiter conversations, freelance opportunities, or mobile engineering roles, these are the fastest ways to reach me.',
              ),
              const SizedBox(height: 22),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth > 820 ? 2 : 1;
                  final contacts = [
                    _ContactItem(
                      icon: Icons.mail_outline,
                      label: 'Email',
                      value: _emailAddress,
                      onTap: () => _contactByEmail(context),
                    ),
                    _ContactItem(
                      icon: Icons.phone_outlined,
                      label: 'Phone',
                      value: _phoneNumber,
                      onTap: () => _openCv(context),
                    ),
                    _ContactItem(
                      icon: Icons.business_center_outlined,
                      label: 'LinkedIn',
                      value: 'linkedin.com/in/qusai-jamous-12a03a272',
                      onTap: () => _openUrl(context, _linkedinUrl),
                    ),
                    _ContactItem(
                      icon: Icons.hub_outlined,
                      label: 'GitHub',
                      value: 'github.com',
                      onTap: () => _openUrl(context, _githubUrl),
                    ),
                    _ContactItem(
                      icon: Icons.chat_bubble_outline,
                      label: 'WhatsApp',
                      value: 'Optional',
                      onTap: () => _openUrl(context, _whatsAppUrl),
                    ),
                  ];
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contacts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      mainAxisExtent: 86,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) => contacts[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, required this.horizontal});

  final Project project;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    final visual = _ProjectVisual(project: project);
    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 10),
        Text(
          project.summary,
          style: const TextStyle(color: Color(0xFFC8D1DC), height: 1.55),
        ),
        const SizedBox(height: 16),
        _LabelBlock(label: 'Problem solved', values: [project.problem]),
        const SizedBox(height: 14),
        _LabelBlock(label: 'Features', values: project.features),
        const SizedBox(height: 14),
        _LabelBlock(label: 'Technologies', values: project.technologies),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _SecondaryButton(
              icon: Icons.code,
              label: 'GitHub',
              onPressed: () => _openUrl(context, _githubUrl),
            ),
            _SecondaryButton(
              icon: Icons.open_in_new,
              label: 'Live Demo',
              onPressed: () => _openUrl(context, _githubUrl),
            ),
          ],
        ),
      ],
    );

    return _HoverLift(
      child: _GlassCard(
        child: horizontal
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: visual),
                  const SizedBox(width: 24),
                  Expanded(flex: 6, child: details),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [visual, const SizedBox(height: 22), details],
              ),
      ),
    );
  }
}

class _ProjectVisual extends StatelessWidget {
  const _ProjectVisual({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              project.accent.withValues(alpha: 0.85),
              const Color(0xFF111827),
            ],
          ),
          border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                project.icon,
                size: 92,
                color: Colors.white.withValues(alpha: 0.28),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(project.icon, size: 34, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  const _SkillGroupCard({required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    return _HoverLift(
      child: _GlassCard(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _IconBadge(icon: group.icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    group.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final skill in group.skills) _SkillChip(text: skill),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _HoverLift(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Row(
            children: [
              _IconBadge(icon: icon),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w800),
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

class _ContributionGraph extends StatelessWidget {
  const _ContributionGraph();

  @override
  Widget build(BuildContext context) {
    final shades = [
      const Color(0xFF1F2937),
      const Color(0xFF065F46),
      const Color(0xFF059669),
      const Color(0xFF34D399),
    ];

    return SizedBox(
      height: 86,
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          for (var i = 0; i < 84; i++)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: shades[(i * 7 + i ~/ 3) % shades.length],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.item});

  final _SnapshotItem item;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, color: const Color(0xFF34D399)),
          const Spacer(),
          Text(
            item.label,
            style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            item.value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w900, height: 1.25),
          ),
        ],
      ),
    );
  }
}

class _LabelBlock extends StatelessWidget {
  const _LabelBlock({required this.label, required this.values});

  final String label;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF34D399),
            fontSize: 12,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final value in values) _SkillChip(text: value)],
        ),
      ],
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
            color: Color(0xFF34D399),
            fontWeight: FontWeight.w900,
            fontSize: 12,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 34,
            height: 1.12,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            color: Color(0xFFAEB7C2),
            fontSize: 16,
            height: 1.65,
          ),
        ),
      ],
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _IconBadge(icon: icon),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF9CA3AF), height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({
    required this.child,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 30,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _HoverLift extends StatefulWidget {
  const _HoverLift({required this.child});

  final Widget child;

  @override
  State<_HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<_HoverLift> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        child: widget.child,
      ),
    );
  }
}

class _Reveal extends StatelessWidget {
  const _Reveal({required this.child, this.delay = Duration.zero});

  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 560 + delay.inMilliseconds),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final adjusted = delay == Duration.zero
            ? value
            : ((value * (560 + delay.inMilliseconds) - delay.inMilliseconds) /
                      560)
                  .clamp(0.0, 1.0);
        return Opacity(
          opacity: adjusted,
          child: Transform.translate(
            offset: Offset(0, (1 - adjusted) * 22),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class _PageSection extends StatelessWidget {
  const _PageSection({required this.child, this.verticalPadding = 34});

  final Widget child;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontal = width < 560 ? 18.0 : 32.0;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: verticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: child,
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
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF34D399).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF34D399).withValues(alpha: 0.28),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF8EF3C5),
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.11)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF34D399),
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 7),
          Text(label, style: const TextStyle(color: Color(0xFFD1D5DB))),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFE5E7EB),
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF34D399).withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF34D399).withValues(alpha: 0.25),
        ),
      ),
      child: Icon(icon, color: const Color(0xFF34D399), size: 22),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
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
      child: IconButton.filledTonal(
        onPressed: onPressed,
        icon: Icon(icon),
        style: IconButton.styleFrom(
          fixedSize: const Size(44, 44),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white.withValues(alpha: 0.08),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: FilledButton.styleFrom(
        minimumSize: const Size(156, 52),
        backgroundColor: const Color(0xFF34D399),
        foregroundColor: const Color(0xFF062014),
        textStyle: const TextStyle(fontWeight: FontWeight.w900),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(146, 52),
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withValues(alpha: 0.22)),
        textStyle: const TextStyle(fontWeight: FontWeight.w900),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

Future<void> _openUrl(BuildContext context, String url) async {
  if (url == _whatsAppUrl) {
    _showMessage(
      context,
      'Add a WhatsApp number when you want to enable this.',
    );
    return;
  }

  final opened = await openExternalLink(url);
  if (!opened && context.mounted) {
    await Clipboard.setData(ClipboardData(text: url));
    if (context.mounted) {
      _showMessage(context, 'Link copied to clipboard.');
    }
  }
}

Future<void> _openCv(BuildContext context) async {
  final opened = await openExternalLink(_cvAssetUrl);
  if (!opened && context.mounted) {
    await Clipboard.setData(const ClipboardData(text: _cvAssetUrl));
    if (context.mounted) {
      _showMessage(context, 'CV link copied to clipboard.');
    }
  }
}

Future<void> _contactByEmail(BuildContext context) async {
  final mailto = Uri(
    scheme: 'mailto',
    path: _emailAddress,
    queryParameters: {'subject': 'Flutter Mobile Developer Opportunity'},
  ).toString();
  final opened = await openExternalLink(mailto);
  if (!opened && context.mounted) {
    await Clipboard.setData(const ClipboardData(text: _emailAddress));
    if (context.mounted) {
      _showMessage(context, 'Email copied to clipboard.');
    }
  }
}

void _showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

class Project {
  const Project({
    required this.title,
    required this.summary,
    required this.problem,
    required this.features,
    required this.technologies,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String summary;
  final String problem;
  final List<String> features;
  final List<String> technologies;
  final IconData icon;
  final Color accent;
}

class SkillGroup {
  const SkillGroup(this.title, this.skills, this.icon);

  final String title;
  final List<String> skills;
  final IconData icon;
}

class _SnapshotItem {
  const _SnapshotItem(this.label, this.value, this.icon);

  final String label;
  final String value;
  final IconData icon;
}
