import 'dart:convert';
import 'dart:io';

class Product {
  final int? id;
  final String name;
  final String? image;
  final int price;
  final File? file;

  Product(
      {this.id,
      required this.name,
      this.image,
      required this.price,
      this.file});
  static Product fromJson(dynamic jsonString) {
    Map<String, dynamic> map = json.decode(json.encode(jsonString));
    return Product(
        name: map["name"],
        image: map["image"],
        price: map['price'],
        id: map['id']);
  }

  static List<Product> fromJsonToList(dynamic jsonString) {
    List<dynamic> list = json.decode(json.encode(jsonString));
    return list
        .map((map) => Product(
            name: map["name"],
            image: map["image"],
            price: map['price'],
            id: map['id']))
        .toList();
  }

  Map<String, String> toMap() => {
        "name": name,
        "price": price.toString(),
        ...(id == null ? {} : {"id": id.toString()})
      };
}
