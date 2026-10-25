class Cat {
  final String breed;
  final String country;
  final String origin;
  final String coat;
  final String pattern;

  Cat({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      breed: json['breed'] as String? ?? 'Unknown',
      country: json['country'] as String? ?? 'Unknown',
      origin: json['origin'] as String? ?? 'Unknown',
      coat: json['coat'] as String? ?? 'Unknown',
      pattern: json['pattern'] as String? ?? 'Unknown',
    );
  }
}