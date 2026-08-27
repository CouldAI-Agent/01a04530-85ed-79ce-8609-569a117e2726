import 'package:flutter/material.dart';

void main() {
  runApp(const AssessmentProposalApp());
}

class AssessmentProposalApp extends StatelessWidget {
  const AssessmentProposalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assessment Proposal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F172A), // Slate 900
          primary: const Color(0xFF2563EB), // Blue 600
          surface: const Color(0xFFF8FAFC), // Slate 50
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProposalPage(),
      },
    );
  }
}

class ProposalPage extends StatelessWidget {
  const ProposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if we are on a wide screen for responsive layout
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Assessment Proposal',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: isWideScreen ? 32.0 : 16.0,
                vertical: 24.0,
              ),
              children: [
                _buildHeader(context),
                const SizedBox(height: 32),
                _buildSectionCard(
                  context,
                  title: '1. Executive Summary',
                  content:
                      'This proposal outlines a comprehensive assessment to evaluate your current system architecture, identify performance bottlenecks, and provide a strategic roadmap for modernization. Our goal is to ensure your infrastructure can scale securely to meet your growing business demands.',
                  icon: Icons.lightbulb_outline,
                ),
                const SizedBox(height: 16),
                _buildSectionCard(
                  context,
                  title: '2. Objectives',
                  content:
                      '• Evaluate current system performance and reliability.\n'
                      '• Identify security vulnerabilities and compliance gaps.\n'
                      '• Assess code quality and maintainability.\n'
                      '• Deliver an actionable migration and improvement roadmap.',
                  icon: Icons.track_changes,
                ),
                const SizedBox(height: 16),
                _buildSectionCard(
                  context,
                  title: '3. Scope & Methodology',
                  content:
                      'Our team will conduct a 3-week deep dive using automated scanning tools combined with manual code review and stakeholder interviews. We will analyze the front-end architecture, back-end APIs, database schema, and cloud deployment configuration.',
                  icon: Icons.analytics_outlined,
                ),
                const SizedBox(height: 16),
                _buildSectionCard(
                  context,
                  title: '4. Timeline & Deliverables',
                  content:
                      'Week 1: Discovery & Documentation Review\n'
                      'Week 2: Technical Analysis & Vulnerability Scanning\n'
                      'Week 3: Synthesis & Report Generation\n\n'
                      'Deliverable: A detailed PDF report including an executive summary, technical findings, risk matrix, and prioritized recommendations.',
                  icon: Icons.calendar_today,
                ),
                const SizedBox(height: 16),
                _buildSectionCard(
                  context,
                  title: '5. Investment',
                  content:
                      'The total fixed cost for this comprehensive assessment is $15,000 USD. This includes all discovery sessions, technical analysis, and the final presentation of findings to your leadership team.',
                  icon: Icons.attach_money,
                ),
                const SizedBox(height: 40),
                _buildActionButtons(context),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project Assessment Proposal',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Prepared for: Acme Corp',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade700,
                  ),
            ),
            Text(
              'Date: Aug 27, 2026',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade700,
                  ),
            ),
          ],
        ),
        const Divider(height: 32, thickness: 1),
      ],
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade800,
                    height: 1.6,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Downloading PDF...')),
            );
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Download PDF'),
        ),
        const SizedBox(width: 16),
        FilledButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Proposal Accepted! Thank you.')),
            );
          },
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Accept Proposal'),
        ),
      ],
    );
  }
}
