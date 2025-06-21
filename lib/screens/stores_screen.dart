import 'package:flutter/material.dart';
import '../widgets/custom_top_bar.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gold = const Color(0xFFB89B51);
    final stores = List.generate(3, (index) => null);
    final storeImages = [
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: Column(
        children: [
          const CustomTopBar(title: 'Stores'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Stores Pill
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                            color: gold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Stores', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Search bar
                    Container(
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
                    const SizedBox(height: 12),
                    // Filter chips
                    Row(
                      children: [
                        FilterChip(
                          label: const Text('Drinks'),
                          selected: true,
                          onSelected: (_) {},
                          selectedColor: gold,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          label: const Text('Food'),
                          selected: false,
                          onSelected: (_) {},
                          selectedColor: gold,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          label: const Text('More Filters'),
                          selected: false,
                          onSelected: (_) {},
                          selectedColor: gold,
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Store cards
                    ...stores.map((_) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: gold),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Habib Halal Store', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: const [
                                            Icon(Icons.star, color: Colors.amber, size: 16),
                                            SizedBox(width: 2),
                                            Text('4.8 reviews', style: TextStyle(fontSize: 13, color: Colors.black87)),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: const [
                                            Text('Closes soon ', style: TextStyle(color: Colors.red, fontSize: 13)),
                                            Text('· 5 pm ', style: TextStyle(color: Colors.red, fontSize: 13)),
                                            Text('· Opens 8 am Tue', style: TextStyle(color: Colors.green, fontSize: 13)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Badge
                                  Container(
                                    decoration: BoxDecoration(
                                      color: gold,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    child: Image.asset('images/halal.png', width: 40, height: 40),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Images row
                              Row(
                                children: storeImages.map((img) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      img,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )).toList(),
                              ),
                              const SizedBox(height: 8),
                              // Buttons row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _StoreButton(label: 'Directions', icon: Icons.directions, color: gold),
                                  _StoreButton(label: 'Reserve', icon: Icons.event_seat, color: gold),
                                  _StoreButton(label: 'Order', icon: Icons.shopping_cart, color: gold),
                                  _StoreButton(label: 'Menu', icon: Icons.menu_book, color: gold),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(height: 24),
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

class _StoreButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const _StoreButton({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(icon, size: 16, color: Colors.white),
          label: Text(label, style: const TextStyle(fontSize: 13)),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            minimumSize: const Size(0, 36),
          ),
        ),
      ),
    );
  }
} 