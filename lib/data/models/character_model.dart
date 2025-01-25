class Character {
  final String name;
  final String image;
  final String description;
  final List<String> drinks;

  Character({
    required this.name,
    required this.image,
    required this.description,
    required this.drinks,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      drinks: List<String>.from(json['drinks'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'drinks': drinks,
    };
  }
}
