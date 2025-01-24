import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CharacterCardCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> characters;

  const CharacterCardCarousel({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: characters.map((character) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/${character['image']}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    character['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
    );
  }
}
