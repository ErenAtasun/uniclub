import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etkinlik Takvimi'),
      ),
      body: Center(
        child: Text(
          'Burada takvim görünecek.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
