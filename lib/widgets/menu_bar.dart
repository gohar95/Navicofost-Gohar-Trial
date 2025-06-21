import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(width: 12),
        MenuButton(icon: Icons.account_balance_wallet, label: 'Wallet'),
        SizedBox(width: 8),
        MenuButton(icon: Icons.history, label: 'History'),
        SizedBox(width: 8),
        MenuButton(icon: Icons.edit_note, label: 'Revision'),
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const MenuButton({required this.icon, required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFD6CBA4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
} 