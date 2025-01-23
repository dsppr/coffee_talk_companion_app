import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/drink_model.dart';

class DrinkRepository {
  Future<List<Drink>> fetchDrinks() async {
    try {
      // Membaca file JSON dari folder assets
      final String response =
          await rootBundle.loadString('lib/assets/data/mock_data.json');
      final Map<String, dynamic> data = json.decode(response);

      // Parsing data menjadi list objek Drink
      return (data['drinks'] as List)
          .map((drink) => Drink.fromJson(drink))
          .toList();
    } catch (e) {
      throw Exception('Failed to load drinks: $e');
    }
  }
}
