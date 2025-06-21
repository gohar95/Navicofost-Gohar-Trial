import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_top_bar.dart';

class HalalPlaceScreen extends StatelessWidget {
  const HalalPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gold = const Color(0xFFB89B51);
    final shopImage = 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500&h=300&fit=crop';
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomTopBar(
            title: 'Halal place',
            isBackButton: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // Map section
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: Image.network(
                          'https://maps.googleapis.com/maps/api/staticmap?center=40.7128,-74.0060&zoom=13&size=600x300&key=YOUR_API_KEY',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Icon(Icons.map, size: 80, color: Colors.grey)),
                        ),
                      ),
                      // Search bar over map
                      Positioned(
                        left: 16,
                        right: 16,
                        top: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: gold),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.black54),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search Halal restaurant & store',
                                    isDense: true,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: gold,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(Icons.tune, color: Colors.white, size: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Gold vertical slider
                      Positioned(
                        right: 16,
                        top: 70,
                        bottom: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('1.0 KM', style: TextStyle(fontSize: 10, color: Colors.black87, backgroundColor: gold.withOpacity(0.7))),
                            const SizedBox(height: 4),
                            Container(
                              height: 100,
                              width: 32,
                              decoration: BoxDecoration(
                                color: gold.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 4,
                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                                    overlayShape: SliderComponentShape.noOverlay,
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.white38,
                                    thumbColor: Colors.white,
                                  ),
                                  child: Slider(
                                    value: 10,
                                    min: 1,
                                    max: 100,
                                    divisions: 99,
                                    onChanged: (v) {},
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                             Text('100 KM', style: TextStyle(fontSize: 10, color: Colors.black87, backgroundColor: gold.withOpacity(0.7))),
                          ],
                        ),
                      ),
                      // Create a Business button
                      Positioned(
                        bottom: -24,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.storefront, color: Colors.white),
                          label: const Text('Create a Business'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: gold,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            elevation: 4,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Content Sheet
                  Padding(
                    padding: const EdgeInsets.only(top: 225.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 48),
                          // Filters
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: gold),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(Icons.tune, color: Colors.black54, size: 20),
                                ),
                                const SizedBox(width: 8),
                                FilterChip(
                                  label: const Text('Drinks'),
                                  selected: false,
                                  onSelected: (_) {},
                                  selectedColor: gold,
                                  backgroundColor: Colors.white,
                                  shape: StadiumBorder(side: BorderSide(color: gold)),
                                ),
                                const SizedBox(width: 8),
                                FilterChip(
                                  label: const Text('Food'),
                                  selected: false,
                                  onSelected: (_) {},
                                  selectedColor: gold,
                                  backgroundColor: Colors.white,
                                  shape: StadiumBorder(side: BorderSide(color: gold)),
                                ),
                                const SizedBox(width: 8),
                                FilterChip(
                                  label: const Text('More Filters'),
                                  selected: false,
                                  onSelected: (_) {},
                                  selectedColor: gold,
                                  backgroundColor: Colors.white,
                                  shape: StadiumBorder(side: BorderSide(color: gold)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // All shops header
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('All shops',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: gold,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    elevation: 0,
                                  ),
                                  child: const Text('See all'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Shop cards
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(left: 16),
                              itemCount: 2,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Container(
                                  width: 220,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: gold),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Badge and image
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Image.network(
                                              shopImage,
                                              height: 120,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            left: 8,
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                color: gold,
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Image.asset('images/halal.png',
                                                  width: 28, height: 28),
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(0.4),
                                                shape: BoxShape.circle,
                                              ),
                                              child: IconButton(
                                                padding: EdgeInsets.zero,
                                                icon: const Icon(Icons.favorite,
                                                    color: Colors.white, size: 18),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                          if (index == 0)
                                            Positioned(
                                              bottom: 8,
                                              right: 8,
                                              child: ElevatedButton.icon(
                                                onPressed: () {},
                                                icon: const Icon(Icons.directions,
                                                    size: 14, color: Colors.white),
                                                label: const Text('Directions',
                                                    style: TextStyle(fontSize: 12)),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: gold,
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 12, vertical: 6),
                                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('Habib Halal Store',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 15)),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                ...List.generate(
                                                    5,
                                                    (i) => const Icon(Icons.star,
                                                        color: Colors.amber, size: 16)),
                                                const SizedBox(width: 4),
                                                const Text('4.8 reviews',
                                                    style: TextStyle(
                                                        fontSize: 13, color: Colors.black87)),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                const Icon(Icons.access_time,
                                                    color: Colors.grey, size: 16),
                                                const SizedBox(width: 4),
                                                if (index == 1)
                                                  const Flexible(
                                                    child: Text(
                                                      'Closes soon . 5 pm . Opens...',
                                                      style: TextStyle(color: Colors.red, fontSize: 13),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
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