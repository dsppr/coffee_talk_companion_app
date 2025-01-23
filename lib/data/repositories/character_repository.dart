import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/character_model.dart';

class CharacterRepository {
  Future<List<Character>> fetchCharacters() async {
    try {
      // Membaca file JSON dari folder assets
      final String response =
          await rootBundle.loadString('lib/assets/data/mock_data.json');
      final Map<String, dynamic> data = json.decode(response);

      // Parsing data menjadi list objek Character
      return (data['characters'] as List)
          .map((character) => Character.fromJson(character))
          .toList();
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}
