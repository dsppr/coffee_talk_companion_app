import 'package:flutter/material.dart';
import '../widgets/character_card.dart';

class CharacterList extends StatelessWidget {
  final List<Map<String, dynamic>> characters;

  const CharacterList({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: ListView.builder(
        itemCount: characters.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final character = characters[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CharacterCard(
              name: character['name'],
              image: 'lib/assets/images/${character['image']}',
              description: character['description'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharacterDetail(
                      character: character,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CharacterDetail extends StatelessWidget {
  final Map<String, dynamic> character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'lib/assets/images/${character['image']}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              character['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              character['description'],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
