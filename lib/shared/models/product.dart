// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_equals_and_hash_code_on_mutable_classes, lines_longer_than_80_chars
import 'dart:convert';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  Product copyWith({
    String? title,
    String? description,
    String? image,
    double? price,
  }) {
    return Product(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(title: $title, description: $description, image: $image, price: $price)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        price.hashCode;
  }
}
