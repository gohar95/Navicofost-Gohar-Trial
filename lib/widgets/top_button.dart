import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String label;
  final VoidCallback? onTap;
  final double iconSize;

  const TopButton({
    super.key,
    this.icon,
    this.imagePath,
    required this.label,
    this.onTap,
    this.iconSize = 24,
  }) : assert(icon != null || imagePath != null, 'Either icon or imagePath must be provided');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFB89B51),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIconOrImage(),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconOrImage() {
    if (imagePath != null) {
      return Image.asset(
        imagePath!,
        width: iconSize,
        height: iconSize,
        color: Colors.white, // This will tint the image white
        // Remove color property if you want to keep original image colors
      );
    } else {
      return Icon(
        icon!,
        color: Colors.white,
        size: iconSize,
      );
    }
  }
}