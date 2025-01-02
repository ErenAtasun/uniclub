import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profil Fotoğrafı
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 16),
            
            // İsim Soyisim
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Okul Bilgisi
            const Text(
              'XYZ University',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            
            // Dahil Olunan Topluluklar
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Dahil Olduğum Topluluklar:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Topluluk Listesi
            Column(
              children: [
                _buildCommunityTile('Flutter Developers Club'),
                _buildCommunityTile('AI Enthusiasts'),
                _buildCommunityTile('Photography Lovers'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Topluluk Kart Tasarımı
  Widget _buildCommunityTile(String communityName) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.group, size: 40),
        title: Text(
          communityName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
