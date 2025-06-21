import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_top_bar.dart';

class HalalBusinessProfileScreen extends StatelessWidget {
  const HalalBusinessProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gold = const Color(0xFFB89B51);
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF7F6F2),
      body: Column(
        children: [
          const CustomTopBar(
            title: 'Halal place',
            isBackButton: false,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  // Business avatar, name, badge, dropdown
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: gold,
                        child: const Text('H', style: TextStyle(fontSize: 32, color: Colors.white)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('NAVICOSOFT UK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                const SizedBox(width: 4),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: const Icon(Icons.check_circle, color: Colors.white, size: 16),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                              ],
                            ),
                            const SizedBox(height: 2),
                            const Text('see how to improve your score', style: TextStyle(color: Colors.black54, fontSize: 13)),
                            const SizedBox(height: 2),
                            GestureDetector(
                              onTap: () {},
                              child: const Text('See Business Profile', style: TextStyle(color: Colors.amber, fontSize: 13, decoration: TextDecoration.underline)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Profile strength card
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: gold),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Profile strength', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 2),
                              Text('see how to improve your score', style: TextStyle(color: Colors.black54, fontSize: 13)),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 36,
                              height: 36,
                              child: CircularProgressIndicator(
                                value: 0.6,
                                backgroundColor: gold.withOpacity(0.2),
                                valueColor: AlwaysStoppedAnimation<Color>(gold),
                                strokeWidth: 4,
                              ),
                            ),
                            const Icon(Icons.person, color: Colors.black26),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Grid of action cards
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                    children: [
                      _ProfileActionCard(label: 'Edit Profile', icon: Icons.edit, color: gold),
                      _ProfileActionCard(label: 'Cover Photo', icon: Icons.photo, color: gold),
                      _ProfileActionCard(label: 'Add logo', icon: Icons.account_circle, color: gold),
                      _ProfileActionCard(label: 'Add Photos', icon: Icons.add_a_photo, color: gold),
                      _ProfileActionCard(label: 'Reviews', icon: Icons.reviews, color: gold),
                      _ProfileActionCard(label: 'Hours', icon: Icons.access_time, color: gold),
                      _ProfileActionCard(label: 'Product Status', icon: Icons.store, color: gold),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Add Products button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.store, color: Colors.white),
                      label: const Text('Add Products'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gold,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileActionCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const _ProfileActionCard({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withOpacity(0.12),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
} 