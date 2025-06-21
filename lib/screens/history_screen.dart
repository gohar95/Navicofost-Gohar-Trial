import 'package:flutter/material.dart';
import '../widgets/custom_top_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gold = const Color(0xFFB89B51);
    final history = [
      {'active': true},
      {'active': false},
      {'active': true},
      {'active': true},
      {'active': true},
      {'active': true},
      {'active': true},
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: Column(
        children: [
          const CustomTopBar(title: 'History'),
          // Top Tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    color: gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('History', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          // List of Cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final isActive = history[index]['active'] as bool;
                return Opacity(
                  opacity: isActive ? 1.0 : 0.3,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: gold.withOpacity(0.2),
                      border: Border.all(color: gold),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://randomuser.me/api/portraits/men/1.jpg',
                          width: 44,
                          height: 44,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text(
                        "🍪 You're Invited to sell Snacks & Drinks!",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: const Text(
                        'March 1,2022 at 4:56pm',
                        style: TextStyle(fontSize: 13),
                      ),
                      trailing: Text(
                        'Earn \$10.00',
                        style: TextStyle(
                          color: gold,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 