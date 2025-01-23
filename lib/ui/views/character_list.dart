import 'package:flutter/material.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Character List')),
      body: Center(
        child: Text(
          'Character List Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
