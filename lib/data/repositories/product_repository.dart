import 'dart:convert';
import 'dart:io';

import 'package:app/data/models/models.dart';
import 'package:app/data/repositories/abstract_repository.dart';
import 'package:app/utils/utils.dart';
import 'package:http/http.dart' as http;

class ProductRepository extends AbstractRepository<Product, int> {
  ProductRepository._();
  factory ProductRepository() => ProductRepository._();

  @override
  Future<Product> delete(Product m) async {
    final res = await http.delete(Uri.parse("$baseurl/products/${m.id}.json"));
    Map<String, dynamic> map = json.decode(res.body);
    return Product.fromJson(map['data']);
  }

  @override
  Future<List<Product>> findAll() async {
    final res = await http.get(Uri.parse("$baseurl/products.json"));
    Map<String, dynamic> map = json.decode(res.body);
    return Product.fromJsonToList(map['data']);
  }

  @override
  Future<Product> findById(int i) async {
    final res = await http.get(Uri.parse("$baseurl/products/$i.json"));
    Map<String, dynamic> map = json.decode(res.body);
    return Product.fromJson(map['data']);
  }

  @override
  Future<Product> update(Product m) async {
    final res =
        await http.post(Uri.parse("$baseurl/products/${m.id}.json"), body: m);
    Map<String, dynamic> map = json.decode(res.body);
    return Product.fromJson(map['data']);
  }

  @override
  Future<Product> create(Product m) async {
    final rep =
        http.MultipartRequest("POST", Uri.parse("$baseurl/products.json"));
    rep.fields.addAll(m.toMap());
    if (m.file != null) {
      rep.files.add(await http.MultipartFile.fromPath("file", m.file!.path));
    }

    final res = await rep.send();
    final stream = await http.Response.fromStream(res);
    print(stream.body);
    Map<String, dynamic> map = json.decode(stream.body);

    return Product.fromJson(map['data']);
  }
}
