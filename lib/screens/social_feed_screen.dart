import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_top_bar.dart';

class SocialFeedScreen extends StatelessWidget {
  const SocialFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gold = const Color(0xFFB89B51);
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: const Color(0xFFF7F6F2),
      body: Column(
        children: [
          CustomTopBar(
            title: 'Social Feed',
            isBackButton: false,
            actions: [
              IconButton(icon: const Icon(Icons.notifications, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(Icons.message, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(Icons.account_circle, color: Colors.white), onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product Banners
                  _ProductBannerSection(gold: gold),
                  // User Post
                  _FeedPost(
                    user: 'Haider Ali',
                    time: '2h ago',
                    text: 'Check out these new halal snacks! 🍪',
                    image: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
                    gold: gold,
                  ),
                  // People You May Know
                  _PeopleYouMayKnowSection(gold: gold),
                  // Map/Location Post
                  _MapPost(gold: gold),
                  // Event Post
                  _EventPost(gold: gold),
                  // Feed Post with two images
                  _FeedPost(
                    user: 'Haider Ali',
                    time: '1d ago',
                    text: 'Try this new halal pizza! 🍕',
                    image: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
                    image2: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
                    gold: gold,
                  ),
                  // Video Post
                  _VideoPost(gold: gold),
                  // Donation/Fundraising Post
                  _DonationPost(gold: gold),
                  // Poll Post
                  _PollPost(gold: gold),
                  // Reels-style Video Post
                  _ReelPost(gold: gold),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductBannerSection extends StatelessWidget {
  final Color gold;
  const _ProductBannerSection({required this.gold});

  @override
  Widget build(BuildContext context) {
    final storyData = [
      {
        'image': 'https://images.unsplash.com/photo-1585435465942-e18791340633?q=80&w=1887&auto=format&fit=crop',
        'user': 'HAider Ali',
        'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=687&q=80'
      },
      {
        'image': 'https://images.unsplash.com/photo-1627461245045-b933e694c489?q=80&w=1887&auto=format&fit=crop',
        'user': 'Haider Ali',
        'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=687&q=80'
      }
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: storyData.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _YourStoryBanner(gold: gold);
          }
          final story = storyData[index - 1];
          return _ProductBanner(
            image: story['image']!,
            user: story['user']!,
            avatar: story['avatar']!,
            gold: gold,
          );
        },
      ),
    );
  }
}

class _YourStoryBanner extends StatelessWidget {
  final Color gold;
  const _YourStoryBanner({required this.gold});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 110,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?q=80&w=2070&auto=format&fit=crop',
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: gold,
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 28),
                    ),
                    const SizedBox(height: 8),
                    const Text('Your Story', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductBanner extends StatelessWidget {
  final String image;
  final String user;
  final String avatar;
  final Color gold;

  const _ProductBanner({required this.image, required this.user, required this.avatar, required this.gold});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 110,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(image, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: gold,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(avatar),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(user, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedPost extends StatelessWidget {
  final String user;
  final String time;
  final String text;
  final String image;
  final String? image2;
  final Color gold;
  const _FeedPost({required this.user, required this.time, required this.text, required this.image, this.image2, required this.gold});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundColor: Colors.brown, child: Text('H', style: TextStyle(color: Colors.white))),
                const SizedBox(width: 8),
                Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                const Icon(Icons.verified, color: Colors.blue, size: 16),
                const Spacer(),
                Text(time, style: const TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 8),
            Text(text),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(image, height: 120, fit: BoxFit.cover),
                  ),
                ),
                if (image2 != null) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(image2!, height: 120, fit: BoxFit.cover),
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(icon: Icon(Icons.favorite_border, color: gold), onPressed: () {}),
                IconButton(icon: Icon(Icons.comment, color: gold), onPressed: () {}),
                IconButton(icon: Icon(Icons.share, color: gold), onPressed: () {}),
                const Spacer(),
                IconButton(icon: Icon(Icons.bookmark_border, color: gold), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PeopleYouMayKnowSection extends StatelessWidget {
  final Color gold;
  const _PeopleYouMayKnowSection({required this.gold});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('People you may know', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                _PersonSuggestion(gold: gold),
                _PersonSuggestion(gold: gold),
                _PersonSuggestion(gold: gold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonSuggestion extends StatelessWidget {
  final Color gold;
  const _PersonSuggestion({required this.gold});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const CircleAvatar(backgroundColor: Colors.brown, child: Text('H', style: TextStyle(color: Colors.white))),
          const SizedBox(height: 4),
          const Text('Haider Ali', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 2),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: gold,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              textStyle: const TextStyle(fontSize: 12),
            ),
            child: const Text('Connect'),
          ),
        ],
      ),
    );
  }
}

class _MapPost extends StatelessWidget {
  final Color gold;
  const _MapPost({required this.gold});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.brown, child: Text('H', style: TextStyle(color: Colors.white))),
            title: const Text('Haider Ali'),
            subtitle: const Text('Shared a location'),
            trailing: const Icon(Icons.verified, color: Colors.blue, size: 16),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://maps.googleapis.com/maps/api/staticmap?center=40.7128,-74.0060&zoom=13&size=600x300&key=YOUR_API_KEY',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.map, size: 80, color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: gold),
                const SizedBox(width: 4),
                const Text('New York, NY'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EventPost extends StatelessWidget {
  final Color gold;
  const _EventPost({required this.gold});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.brown, child: Text('H', style: TextStyle(color: Colors.white))),
            title: const Text('Haider Ali'),
            subtitle: const Text('Created an event'),
            trailing: const Icon(Icons.verified, color: Colors.blue, size: 16),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.event, color: gold),
                const SizedBox(width: 4),
                const Text('Halal Meetup - April 1'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoPost extends StatelessWidget {
  final Color gold;
  const _VideoPost({required this.gold});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.brown, child: Text('H', style: TextStyle(color: Colors.white))),
            title: const Text('Haider Ali'),
            subtitle: const Text('Shared a video'),
            trailing: const Icon(Icons.verified, color: Colors.blue, size: 16),
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Icon(Icons.play_circle_fill, color: Colors.white, size: 48),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.ondemand_video, color: gold),
                const SizedBox(width: 4),
                const Text('Watch on YouTube'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DonationPost extends StatelessWidget {
  final Color gold;
  const _DonationPost({required this.gold});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.brown, child: Text('H', style: TextStyle(color: Colors.white))),
            title: const Text('Haider Ali'),
            subtitle: const Text('Started a fundraiser'),
            trailing: const Icon(Icons.verified, color: Colors.blue, size: 16),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ukgm Fundraising Help Children', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gold,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text('Donate Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PollPost extends StatelessWidget {
  final Color gold;
  const _PollPost({required this.gold});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.brown, child: Text('H', style: TextStyle(color: Colors.white))),
            title: const Text('Haider Ali'),
            subtitle: const Text('Created a poll'),
            trailing: const Icon(Icons.verified, color: Colors.blue, size: 16),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('What is your favorite halal snack?'),
                const SizedBox(height: 8),
                _PollOption(label: 'Dates', percent: 0.4, gold: gold),
                _PollOption(label: 'Cookies', percent: 0.3, gold: gold),
                _PollOption(label: 'Halal Jerky', percent: 0.2, gold: gold),
                _PollOption(label: 'Other', percent: 0.1, gold: gold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PollOption extends StatelessWidget {
  final String label;
  final double percent;
  final Color gold;
  const _PollOption({required this.label, required this.percent, required this.gold});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Expanded(
            flex: (percent * 100).toInt(),
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(label, style: const TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            flex: 100 - (percent * 100).toInt(),
            child: Container(
              height: 24,
              color: Colors.grey[200],
            ),
          ),
          const SizedBox(width: 8),
          Text('${(percent * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _ReelPost extends StatelessWidget {
  final Color gold;
  const _ReelPost({required this.gold});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1504674900247-0877df9cc836'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            bottom: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(backgroundColor: Colors.brown, child: Text('H', style: TextStyle(color: Colors.white))),
                const SizedBox(height: 8),
                const Text('Haider Ali', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.favorite, color: gold),
                    const SizedBox(width: 4),
                    const Text('1.2k', style: TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.comment, color: gold),
                    const SizedBox(width: 4),
                    const Text('300', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 