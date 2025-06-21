import 'package:flutter/material.dart';
import 'package:untitled/screens/halal_business_profile_screen.dart';
import 'package:untitled/screens/halal_place_screen.dart';
import 'package:untitled/screens/social_feed_screen.dart';
import 'package:untitled/screens/stores_screen.dart';
import 'package:untitled/screens/wallet_screen.dart';
import 'package:untitled/widgets/app_drawer.dart';
import 'history_screen.dart';
import '../widgets/top_button.dart';
import '../widgets/challenge_card.dart';
import '../widgets/custom_top_bar.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomTopBar(isBackButton: false),


          // Top Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TopButton(
                    imagePath: 'images/wallet.png',
                    label: "Wallet",
                    onTap: () {
                      print('Wallet Tapped');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WalletScreen()),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  TopButton(
                    imagePath: 'images/history.png',
                    label: "History",
                    onTap: () {
                      print('History Tapped');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryScreen()),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  TopButton(
                    imagePath: 'images/revision.png',
                    label: "Revision",
                    onTap: () {
                      print('Revision Tapped');
                    },
                  ),
                  // const SizedBox(width: 12),
                  // TopButton(
                  //   imagePath: 'images/revision.png',
                  //   label: "Feed",
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const SocialFeedScreen()),
                  //     );
                  //     print('Revision Tapped');
                  //   },
                  // ),
                  // const SizedBox(width: 12),
                  // TopButton(
                  //   imagePath: 'images/revision.png',
                  //   label: "Halal Shop",
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const HalalPlaceScreen()),
                  //     );
                  //     print('Revision Tapped');
                  //   },
                  // ),
                  // const SizedBox(width: 12),
                  // TopButton(
                  //   imagePath: 'images/revision.png',
                  //   label: "Profile",
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const HalalBusinessProfileScreen()),
                  //     );
                  //     print('Revision Tapped');
                  //   },
                  // ),
                  // const SizedBox(width: 12),
                  // TopButton(
                  //   imagePath: 'images/revision.png',
                  //   label: "Stores",
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const StoresScreen()),
                  //     );
                  //     print('Revision Tapped');
                  //   },
                  // ),
                ],
              ),
            ),
          ),

          // List of Cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              children: const [
                ChallengeCard(
                  isHot: true,
                  isCrowned: false,
                  imagePath: 'images/challenge1.png',
                  reward: "\$3.99",
                  time: "6h 30min",
                  accepted: 2502,
                  imageColor: Colors.white,
                ),
                ChallengeCard(
                  isHot: false,
                  isCrowned: true,
                  imagePath: 'images/challenge2.png',
                  reward: "\$3.99",
                  time: "6h 30min",
                  accepted: 2502,
                  imageColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}