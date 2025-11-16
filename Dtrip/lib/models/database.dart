class Place {
  final String name;
  final String address;
  final int favorite;
  final String image;

  Place({
    required this.name,
    required this.address,
    required this.favorite,
    required this.image,
  });

  factory Place.fromDocument(Map<String, dynamic> doc) {
    return Place(
      name: doc['name'] ?? '',
      address: doc['address'] ?? '',
      favorite: doc['favorite'] ?? 0,
      image: doc['image'] ?? '',
    );
  }
}
