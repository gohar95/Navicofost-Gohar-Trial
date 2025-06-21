import 'package:flutter/material.dart';
import '../screens/challenge_details_screen.dart';

class ChallengeCard extends StatelessWidget {
  final bool isHot;
  final bool isCrowned;
  final IconData? image;
  final String? imagePath;
  final Color imageColor;
  final String reward;
  final String time;
  final int accepted;

  const ChallengeCard({
    super.key,
    required this.isHot,
    required this.isCrowned,
    this.image,
    this.imagePath,
    required this.reward,
    required this.time,
    required this.accepted,
    required this.imageColor,
  }) : assert(image != null || imagePath != null, 'Either image or imagePath must be provided');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChallengeDetailsScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,2),
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isHot)
                      const Icon(Icons.local_fire_department, color: Colors.orange, size: 20)
                    else if (isCrowned)
                      const Icon(Icons.emoji_events, color: Colors.amber, size: 20)
                    else
                      const SizedBox(width: 20),

                    // Avatar
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('images/app.png'),
                          backgroundColor: Colors.transparent,
                        ),

                        // Title & Subtitle
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Mustakshif", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text("Activities", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),

                    Icon(Icons.bookmark_border, color: Color(0xFFD6C7A1)),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  "🍪 You're Invited to sell Snacks & Drinks!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),

                Text(
                  "From sweet treats to trendy drinks, food sells fast on TikTok. Start now & get",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Time & Reward (Left 50%)
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 180, // Match image height
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color(0XFFB89B51).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: const Color(0xFFB89B51)),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.access_time, size: 30, color: Colors.black),
                                    const SizedBox(height: 6),
                                    Text("End: $time", style: const TextStyle(fontSize: 14,color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFF2),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: const Color(0xFFB89B51)),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.attach_money, size: 30, color: Colors.black),
                                    const SizedBox(height: 6),
                                    Text("Earn a $reward", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Image or Icon (Right 50%)
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: imageColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFB89B51), width: 2),
                        ),
                        child: Center(
                          child: _buildImageOrIcon(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Bottom Row: Accepted, View more
                Row(
                  children: [
                    const Icon(Icons.people, size: 16, color: Color(0xFFB89B51)),
                    const SizedBox(width: 4),
                    Text("$accepted people accepted this challenge", style: const TextStyle(fontSize: 15,color: Color(0xFFB89B51))),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("View more >", style: TextStyle(fontSize: 15, color: Color(0xFFB89B51))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageOrIcon() {
    if (imagePath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath!,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to icon if image fails to load
            return Icon(image ?? Icons.image_not_supported, size: 40, color: imageColor);
          },
        ),
      );
    } else {
      return Icon(image!, size: 40, color: imageColor);
    }
  }
}