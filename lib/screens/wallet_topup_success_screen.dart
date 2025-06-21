import 'package:flutter/material.dart';
import '../widgets/custom_top_bar.dart';

class WalletTopupSuccessScreen extends StatelessWidget {
  const WalletTopupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gold = const Color(0xFFB89B51);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: Column(
        children: [
          const CustomTopBar(title: 'My Wallets'),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
                        decoration: BoxDecoration(
                          color: gold.withOpacity(0.15),
                          border: Border.all(color: gold),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 8),
                            const Center(
                              child: Text('Top up Success', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            ),
                            const SizedBox(height: 8),
                            const Center(
                              child: Text('May 16, 2024  .  03:30 PM', style: TextStyle(color: Colors.black54, fontSize: 14)),
                            ),
                            const SizedBox(height: 4),
                            const Center(
                              child: Text('No Ref 658545421545465554654', style: TextStyle(color: Colors.black38, fontSize: 13)),
                            ),
                            const SizedBox(height: 12),
                            const Divider(),
                            const Center(
                              child: Text('Top up Summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25,0,25,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('User ID', style: TextStyle(fontSize: 15)),
                                  Text('haiderali.x7', style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25,0,25,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Amount', style: TextStyle(fontSize: 15)),
                                  Text('2450.00', style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25,0,25,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Admin Fee', style: TextStyle(fontSize: 15)),
                                  Text('241.00', style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25,0,25,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Total Amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                  Text('2451.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                ],
                              ),
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
                                  const Text('Paypal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Green check icon
                      Positioned(
                        top: 0,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.check, color: Colors.white, size: 48),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 