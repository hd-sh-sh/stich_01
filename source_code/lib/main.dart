import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MonthlySpendingApp());
}

class MonthlySpendingApp extends StatelessWidget {
  const MonthlySpendingApp({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFFFBFAF9);
    const deepTaupe = Color(0xFF4A4441);
    const roseGold = Color(0xFFC5A898);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: background,
        textTheme: GoogleFonts.montserratTextTheme().copyWith(
          bodyMedium: GoogleFonts.montserrat(color: deepTaupe),
        ),
        colorScheme: const ColorScheme.light(
          primary: deepTaupe,
          secondary: roseGold,
          surface: background,
        ),
      ),
      home: const MonthlyOverviewScreen(),
    );
  }
}

class MonthlyOverviewScreen extends StatelessWidget {
  const MonthlyOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const deepTaupe = Color(0xFF4A4441);
    const roseGold = Color(0xFFC5A898);
    const mutedRose = Color(0xFFE5D1C5);
    const sage = Color(0xFF8A9A8C);
    const background = Color(0xFFFBFAF9);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: background.withOpacity(0.9),
                elevation: 0,
                title: Text(
                  'August Overview',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: deepTaupe,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  color: roseGold,
                  onPressed: () {},
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.calendar_month_outlined),
                    color: roseGold,
                    onPressed: () {},
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: _TotalSpendingCard(
                    deepTaupe: deepTaupe,
                    roseGold: roseGold,
                    mutedRose: mutedRose,
                    sage: sage,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                  child: _SectionHeader(roseGold: roseGold, deepTaupe: deepTaupe),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _TransactionTile(
                      icon: Icons.local_mall_outlined,
                      title: 'Essentials & Home',
                      subtitle: 'Today, 2:30 PM',
                      amount: r'$120.50',
                      deepTaupe: deepTaupe,
                      roseGold: roseGold,
                      sage: sage,
                      showDivider: true,
                      mutedRose: mutedRose,
                    ),
                    _TransactionTile(
                      icon: Icons.spa_outlined,
                      title: 'Wellness & Beauty',
                      subtitle: 'Yesterday, 4:15 PM',
                      amount: r'$45.00',
                      deepTaupe: deepTaupe,
                      roseGold: roseGold,
                      sage: sage,
                      showDivider: true,
                      mutedRose: mutedRose,
                    ),
                    _TransactionTile(
                      icon: Icons.restaurant_outlined,
                      title: 'Dining & Evening',
                      subtitle: 'Aug 24, 8:20 PM',
                      amount: r'$88.20',
                      deepTaupe: deepTaupe,
                      roseGold: roseGold,
                      sage: sage,
                      showDivider: true,
                      mutedRose: mutedRose,
                    ),
                    _TransactionTile(
                      icon: Icons.local_cafe_outlined,
                      title: 'Cafe & Patisserie',
                      subtitle: 'Aug 23, 9:00 AM',
                      amount: r'$6.75',
                      deepTaupe: deepTaupe,
                      roseGold: roseGold,
                      sage: sage,
                      showDivider: false,
                      mutedRose: mutedRose,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Icon(
                        Icons.local_florist_outlined,
                        color: roseGold.withOpacity(0.2),
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 140),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _BottomNavigation(
              roseGold: roseGold,
              sage: sage,
              deepTaupe: deepTaupe,
              mutedRose: mutedRose,
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalSpendingCard extends StatelessWidget {
  const _TotalSpendingCard({
    required this.deepTaupe,
    required this.roseGold,
    required this.mutedRose,
    required this.sage,
  });

  final Color deepTaupe;
  final Color roseGold;
  final Color mutedRose;
  final Color sage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFCFB),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: mutedRose.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -20,
            child: Icon(
              Icons.eco_outlined,
              color: sage.withOpacity(0.12),
              size: 160,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Spending',
                style: GoogleFonts.montserrat(
                  color: roseGold,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                r'$2,450.00',
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                  color: deepTaupe,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                height: 1,
                color: mutedRose.withOpacity(0.4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 180,
                    height: 1,
                    color: sage,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Spent',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.8,
                      color: sage,
                    ),
                  ),
                  Text(
                    'Budget: $3,000',
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.8,
                      color: roseGold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.roseGold,
    required this.deepTaupe,
  });

  final Color roseGold;
  final Color deepTaupe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Transactions',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: deepTaupe,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'REFINED TRACKING',
              style: GoogleFonts.montserrat(
                color: roseGold.withOpacity(0.6),
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.4,
              ),
            ),
          ],
        ),
        Text(
          'Filter',
          style: GoogleFonts.montserrat(
            color: roseGold,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.8,
            decoration: TextDecoration.underline,
            decorationColor: roseGold.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.deepTaupe,
    required this.roseGold,
    required this.sage,
    required this.showDivider,
    required this.mutedRose,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final Color deepTaupe;
  final Color roseGold;
  final Color sage;
  final bool showDivider;
  final Color mutedRose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        border: showDivider
            ? Border(
                bottom: BorderSide(color: mutedRose.withOpacity(0.2)),
              )
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: sage, size: 32),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: deepTaupe,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle.toUpperCase(),
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.8,
                    color: roseGold.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: deepTaupe,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    required this.roseGold,
    required this.sage,
    required this.deepTaupe,
    required this.mutedRose,
  });

  final Color roseGold;
  final Color sage;
  final Color deepTaupe;
  final Color mutedRose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 32),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFAF9).withOpacity(0.9),
        border: Border(top: BorderSide(color: mutedRose.withOpacity(0.2))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavItem(
              icon: Icons.grid_view_outlined,
              label: 'Overview',
              color: sage,
            ),
            _NavItem(
              icon: Icons.timeline_outlined,
              label: 'Analysis',
              color: roseGold.withOpacity(0.6),
            ),
            Container(
              margin: const EdgeInsets.only(top: -28),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: deepTaupe,
                child: const Icon(Icons.add, color: Colors.white, size: 32),
              ),
            ),
            _NavItem(
              icon: Icons.account_balance_outlined,
              label: 'Savings',
              color: roseGold.withOpacity(0.6),
            ),
            _NavItem(
              icon: Icons.face_3_outlined,
              label: 'Profile',
              color: roseGold.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 6),
        Text(
          label.toUpperCase(),
          style: GoogleFonts.montserrat(
            color: color,
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.8,
          ),
        ),
      ],
    );
  }
}
