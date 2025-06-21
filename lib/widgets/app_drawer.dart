import 'package:flutter/material.dart';
import 'package:untitled/screens/stores_screen.dart';
import '../screens/halal_business_profile_screen.dart';
import '../screens/halal_place_screen.dart';
import '../screens/social_feed_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('user.name@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/app.png'),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFB89B51),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.feed),
            title: const Text('Social Feed'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SocialFeedScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Halal Place'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HalalPlaceScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Halal Business Profile'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HalalBusinessProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Halal Stores'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const StoresScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
} 