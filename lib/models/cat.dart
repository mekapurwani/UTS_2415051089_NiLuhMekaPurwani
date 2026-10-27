class Cat {
  final String breed;
  final String country;
  final String origin;
  final String coat;
  final String pattern;
  final String price;
  final String imageUrl;

  Cat({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
    this.price = 'Rp 1.500.000', 
    String? imageUrl,
  }) : imageUrl = imageUrl ?? 'https://cataas.com/cat?width=400&height=400&t=$breed';

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      breed: json['breed'] as String? ?? 'Ras Tidak Diketahui',
      country: json['country'] as String? ?? 'Bali',
      origin: json['origin'] as String? ?? 'Lokal',
      coat: json['coat'] as String? ?? 'Pendek',
      pattern: json['pattern'] as String? ?? 'Polos',
    );
  }
}