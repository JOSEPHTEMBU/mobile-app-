class Post {
  final int? id;
  final String title;
  final String description;
  final String location;
  final double price;

  Post(
      {this.id,
      required this.title,
      required this.description,
      required this.location,
      required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      location: map['location'],
      price: map['price'],
    );
  }
}
