import 'package:flutter/material.dart';
import '../screens/community_detail.dart';
import 'profile_screen.dart';

class CommunitySearchScreen extends StatefulWidget {
  @override
  _CommunitySearchScreenState createState() => _CommunitySearchScreenState();
}

class _CommunitySearchScreenState extends State<CommunitySearchScreen> {
  final List<Map<String, String>> communities = [
    {
      'name': 'Flutter Developers',
      'logo': 'https://via.placeholder.com/100',
      'description': 'A community for Flutter enthusiasts.',
    },
    {
      'name': 'AI Enthusiasts',
      'logo': 'https://via.placeholder.com/100',
      'description': 'A community for AI and ML enthusiasts.',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCommunities = communities.where((community) {
      return community['name']!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Topluluk Ara'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Topluluk Ara',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: filteredCommunities.length,
              itemBuilder: (context, index) {
                final community = filteredCommunities[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommunityDetailScreen(
                          name: community['name']!,
                          logo: community['logo']!,
                          description: community['description']!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          community['logo']!,
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          community['name']!,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: const Text('Profil Ekranına Git'),
          ),
        ],
      ),
    );
  }
}
