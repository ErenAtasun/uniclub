import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<String> clubs = ['Club A', 'Club B', 'Club C', 'Club D', 'Club E'];
  final List<String> images = [
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
    'https://via.placeholder.com/100',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Clubs'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (query) {
                // Add search functionality if needed
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: clubs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.network(
                      images[index],
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 8),
                    Text(clubs[index]),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
