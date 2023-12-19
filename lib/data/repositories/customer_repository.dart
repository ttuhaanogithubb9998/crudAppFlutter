import 'dart:convert';

import 'package:app/data/models/models.dart';
import 'package:app/data/repositories/abstract_repository.dart';
import 'package:app/utils/utils.dart';
import 'package:http/http.dart' as http;

class CustomerRepository extends AbstractRepository<Customer, int> {
  CustomerRepository._();
  factory CustomerRepository() => CustomerRepository._();

  @override
  Future<Customer> delete(Customer m) async {
    final res = await http.delete(Uri.parse("$baseurl/customers/${m.id}.json"));
    Map<String, dynamic> map = json.decode(res.body);
    return Customer.fromJson(map['data']);
  }

  @override
  Future<List<Customer>> findAll() async {
    final res = await http.get(Uri.parse("$baseurl/customers.json"));
    Map<String, dynamic> map = json.decode(res.body);
    return Customer.fromJsonToList(map['data']);
  }

  @override
  Future<Customer> findById(int i) async {
    final res = await http.get(Uri.parse("$baseurl/customers/$i.json"));
    Map<String, dynamic> map = json.decode(res.body);
    return Customer.fromJson(map['data']);
  }

  @override
  Future<Customer> update(Customer m) async {
    final res =
        await http.post(Uri.parse("$baseurl/customers/${m.id}.json"), body: m);
    Map<String, dynamic> map = json.decode(res.body);
    return Customer.fromJson(map['data']);
  }

  @override
  Future<Customer> create(Customer m) async {
    final res =
        await http.post(Uri.parse("$baseurl/customers/${m.id}.json"), body: m);
    Map<String, dynamic> map = json.decode(res.body);
    return Customer.fromJson(map['data']);
  }
}
