import 'package:flutter/material.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Character Detail')),
      body: Center(
        child: Text(
          'Character Detail Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
