import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../widgets/custom_top_bar.dart';

class ChallengeDetailsScreen extends StatefulWidget {
  const ChallengeDetailsScreen({super.key});

  @override
  State<ChallengeDetailsScreen> createState() => _ChallengeDetailsScreenState();
}

class _ChallengeDetailsScreenState extends State<ChallengeDetailsScreen> {
  // late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = YoutubePlayerController(
    //   initialVideoId: 'dQw4w9WgXcQ', // Example video ID
    //   flags: const YoutubePlayerFlags(
    //     autoPlay: false,
    //     mute: false,
    //   ),
    // );
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gold = const Color(0xFFD6C7A1);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: Column(
        children: [
          const CustomTopBar(title: 'Challenge Details'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Header Card
                    Container(
                      decoration: BoxDecoration(
                        color: gold,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: gold, width: 1),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 28,
                            backgroundImage: AssetImage('images/app.png'),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: gold.withOpacity(0.7),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              border: Border.all(color: gold, width: 1),
                            ),
                            child: const Center(
                              child: Text(
                                'Earning a \$3.99',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Creator, End Time, Bookmark
                    Row(
                      children: [
                        const Text('Mustakshif', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(width: 8),
                        const Icon(Icons.circle, color: Colors.red, size: 10),
                        const SizedBox(width: 4),

                        const Spacer(),
                        Icon(Icons.bookmark_border, color: gold),
                      ],
                    ),
                    const Text('challenge ends March 1, 2022 at 4:56pm', style: TextStyle(color: Colors.red, fontSize: 12)),
                    const SizedBox(height: 12),
                    // Challenge Video with Duration
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            height: 120,
                            width: double.infinity,
                            // child: YoutubePlayer(
                            //   controller: _controller,
                            //   showVideoProgressIndicator: true,
                            // ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: gold,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text('2:21', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Title & Subtitle
                    Text(
                      "🍪 You're Invited to sell Snacks & Drinks!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'From sweet treats to trendy drinks, food sells fast on TikTok. Start now & get',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    // Tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: gold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Requirements', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: gold),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Leaderboard'),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: gold),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Tips'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Requirements Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: gold),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('💡 Life sharing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 8),
                          const Text('• Record a gym video that makes you look like you just leveled up: heavy lifts, explosive sets, or walking in like a boss 🕺🏋️‍♂️'),
                          const SizedBox(height: 4),
                          const Text('• Sync your moves to the drop, it\'s giving "upgrade unlocked" energy 🎉🎮'),
                          const SizedBox(height: 4),
                          const Text('• Make it intense, stylish and bold. Think of this sound as your final form 💪🔥'),
                          const SizedBox(height: 12),
                          const Text('🎥 Other content requirements', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          const Text('• You must appear in the video 🎥'),
                          const Text('• Your content must be original, high-quality, and inspire others to jump on the trend 💡'),
                          const Text('• AI-generated videos are not valid 🚫'),
                          const SizedBox(height: 12),
                          const Text('📎 Reference posts', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[300],
                                ),
                                child: const Icon(Icons.qr_code, size: 32),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[300],
                                ),
                                child: const Icon(Icons.qr_code, size: 32),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[300],
                                ),
                                child: const Icon(Icons.person, size: 32),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text('📄 Submission formats', style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('Videos longer than 10 seconds'),
                          const SizedBox(height: 8),
                          const Text('🌐 Primary post language', style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('English'),
                          const SizedBox(height: 8),
                          const Text('🛡 Other submission requirements', style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('Keep your submission public for 10 days to be considered.'),
                          const Text('Fake engagement, unoriginal content, or violations of TikTok Community Guidelines will result in disqualification.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Important Information
                    const Text(
                      'Important information',
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'This campaign is only open to creators based on the content they post. For submissions to be eligible, they must comply with the Campaign rules',
                      style: TextStyle(color: Colors.black38, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Some campaign requirements and tips provided by initiators are originally in their own languages and are machine-translated.',
                      style: TextStyle(color: Colors.black38, fontSize: 13),
                    ),
                    const SizedBox(height: 24),
                    // Bottom Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.photo_camera, color: Colors.white),
                            label: const Text('Take Camera'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: gold,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              textStyle: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.upload, color: Colors.white),
                            label: const Text('Upload Video'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: gold,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              textStyle: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 