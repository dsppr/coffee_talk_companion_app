class Drink {
  final String name;
  final String image;
  final List<String> ingredients;
  final List<String> customers;

  Drink({
    required this.name,
    required this.image,
    required this.ingredients,
    required this.customers,
  });

  // Parsing
  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      name: json['name'] as String,
      image: json['image'] as String,
      ingredients: List<String>.from(json['ingredients'] as List<dynamic>),
      customers: List<String>.from(json['customers'] as List<dynamic>),
    );
  }

  // Mengubah object menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'ingredients': ingredients,
      'customers': customers,
    };
  }
}
