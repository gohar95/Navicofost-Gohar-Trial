import 'package:flutter/material.dart';
import 'package:untitled/screens/wallet_set_amount_screen.dart';
import '../widgets/custom_top_bar.dart';
import 'wallet_topup_success_screen.dart';

class WalletTopupScreen extends StatelessWidget {
  const WalletTopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gold = const Color(0xFFB89B51);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: Column(
        children: [
          const CustomTopBar(title: 'My Wallets'),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  // Wallets Pill
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('Wallets',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Balance Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: gold.withOpacity(0.2),
                      border: Border.all(color: gold),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Wallets', style: TextStyle(
                            color: gold , fontWeight: FontWeight.w500)),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                                'USD ', style: TextStyle(fontSize: 18, color: Colors
                                .black54)),
                            const Text('45,804.10', style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text('Total', style: TextStyle(
                                  fontSize: 16, color: gold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Top up card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: gold.withOpacity(0.15),
                      border: Border.all(color: gold),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Center(
                          child: Text('Top up money', style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        const SizedBox(height: 8),
                        const Center(
                          child: Text('\$2450.00', style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32)),
                        ),
                        const SizedBox(height: 16),
                        Divider(
                          color: gold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('User ID', style: TextStyle(fontSize: 15)),
                            Text('haiderali.x7', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Amount', style: TextStyle(fontSize: 15)),
                            Text('2450.00', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Admin Fee', style: TextStyle(fontSize: 15)),
                            Text('241.00', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Total Amount',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            Text('2451.00', style: TextStyle(fontWeight: FontWeight
                                .bold, fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Paypal button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: gold),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/paypal.png',
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(width: 8),
                              const Text('Paypal', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WalletTopupSuccessScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: gold,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Change Amount link
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WalletSetAmountScreen()),
                        );
                      },
                      child: const Text(
                          'Change Amount', style: TextStyle(color: Color(0XFF1565C0),fontWeight: FontWeight.bold)),
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