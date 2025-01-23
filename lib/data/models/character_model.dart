class Character {
  final String name;
  final String image;
  final String description;

  Character({
    required this.name,
    required this.image,
    required this.description,
  });

  // Parsing
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );
  }

  // Mengubah object menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
    };
  }
}
