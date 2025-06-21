import 'package:flutter/material.dart';

class WalletSetAmountScreen extends StatefulWidget {
  const WalletSetAmountScreen({super.key});

  @override
  State<WalletSetAmountScreen> createState() => _WalletSetAmountScreenState();
}

class _WalletSetAmountScreenState extends State<WalletSetAmountScreen> {
  final Color gold = const Color(0xFFB89B51);
  double amount = 50.0;
  final List<double> presets = [10, 50, 100];
  final TextEditingController _controller = TextEditingController();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller.text = amount.toStringAsFixed(2);
  }

  void _setAmount(double value) {
    setState(() {
      amount = value;
      _controller.text = value.toStringAsFixed(2);
      isEditing = false;
    });
  }

  void _editAmount() {
    setState(() {
      isEditing = true;
      _controller.text = amount.toStringAsFixed(2);
    });
  }

  void _onAmountChanged(String value) {
    final parsed = double.tryParse(value);
    if (parsed != null && parsed > 0) {
      setState(() {
        amount = parsed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // Top bar
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'My Wallets',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 16),
                // Balance card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: gold, width: 1.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Wallets',
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'USD',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '45,804.10',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Set Amount card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: gold.withOpacity(0.08),
                    border: Border.all(color: gold),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text('Set Amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      const SizedBox(height: 4),
                      const Center(
                        child: Text('How much would you like top up', style: TextStyle(color: Colors.black54)),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: GestureDetector(
                          onTap: _editAmount,
                          child: isEditing
                              ? SizedBox(
                                  width: 120,
                                  child: TextField(
                                    controller: _controller,
                                    autofocus: true,
                                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                                    onChanged: _onAmountChanged,
                                    onSubmitted: (_) => setState(() => isEditing = false),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                    ),
                                  ),
                                )
                              : Text(
                                  '24${amount.toStringAsFixed(2)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                                ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: presets.map((preset) {
                          final selected = amount == preset && !isEditing;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: OutlinedButton(
                              onPressed: () => _setAmount(preset),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: selected ? gold.withOpacity(0.15) : Colors.transparent,
                                side: BorderSide(color: selected ? gold : Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Text(
                                '24${preset.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: selected ? gold : Colors.black54,
                                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Top up method
                const Center(
                  child: Text('Top up method', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: gold),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset('images/paypal.png', width: 32, height: 32),
                      const SizedBox(width: 8),
                      const Text('Paypal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Continue button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gold,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 