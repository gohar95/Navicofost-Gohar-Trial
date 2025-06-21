import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onBack;
  final Color backgroundColor;
  final double borderRadius;
  final List<Widget>? actions;
  final bool isBackButton;

  const CustomTopBar({
    Key? key,
    this.title,
    this.onBack,
    this.backgroundColor = const Color(0xFFB89B51),
    this.borderRadius = 30,
    this.actions,
    this.isBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: isBackButton ? (onBack ?? () => Navigator.pop(context)) : () => Scaffold.of(context).openDrawer(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    isBackButton ? Icons.arrow_back_ios_new : Icons.menu,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              if (title != null) ...[
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ] else ...[
                const Spacer(),
              ],
              if (actions != null) ...actions!,
            ],
          ),
        ),
      ),
    );
  }
} 