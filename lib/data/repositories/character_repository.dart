import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/character_model.dart';

class CharacterRepository {
  Future<List<Character>> fetchCharacters() async {
    try {
      final String response =
          await rootBundle.loadString('lib/assets/data/mock_data.json');
      final Map<String, dynamic> data = json.decode(response);

      if (!data.containsKey('characters')) {
        throw Exception('Characters key is missing in JSON.');
      }

      return (data['characters'] as List)
          .map((character) => Character.fromJson(character))
          .toList();
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}
