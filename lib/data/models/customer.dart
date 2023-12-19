import 'dart:convert';

class Customer {
  final int? id;
  final String name;
  final String email;
  final String phone;

  Customer(
      {this.id, required this.name, required this.email, required this.phone});

  static Customer fromJson(dynamic jsonString) {
    Map<String, dynamic> map = json.decode(json.encode(jsonString));
    return Customer(
        name: map["name"],
        email: map["email"],
        phone: map['phone'],
        id: map['id']);
  }

  static List<Customer> fromJsonToList(dynamic jsonString) {
    List<dynamic> list = json.decode(json.encode(jsonString));
    return list
        .map((map) => Customer(
            name: map["name"],
            email: map["email"],
            phone: map['phone'],
            id: map['id']))
        .toList();
  }
}
