import 'package:flutter/material.dart';
import 'calendar_screen.dart';

class ClubListScreen extends StatelessWidget {
  final List<String> clubs = ['Müzik Kulübü', 'Tiyatro Topluluğu', 'Spor Kulübü'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kulüpler ve Topluluklar'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarScreen()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: clubs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clubs[index]),
          );
        },
      ),
    );
  }
}
