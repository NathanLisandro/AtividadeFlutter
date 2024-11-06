class Professional {
  final int id;
  final String name;
  final double rating;
  final double pricePerHour;

  Professional({
    required this.id,
    required this.name,
    required this.rating,
    required this.pricePerHour,
  });

  factory Professional.fromJson(Map<String, dynamic> json) {
    return Professional(
      id: json['id'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      pricePerHour: json['pricePerHour'].toDouble(),
    );
  }
}
