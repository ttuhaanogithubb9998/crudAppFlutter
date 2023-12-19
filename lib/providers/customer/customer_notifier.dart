import 'package:app/data/models/models.dart';
import 'package:app/data/repositories/customer_repository.dart';
import 'package:app/providers/customer/customer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerNotifier extends StateNotifier<CustomerState> {
  CustomerNotifier() : super(CustomerState(customers: [])) {
    getAll();
  }
  final CustomerRepository _customerRepository = CustomerRepository();
  getAll() async {
    state = CustomerState(customers: await _customerRepository.findAll());
  }

  void delete(Customer customer) async {
    await _customerRepository.delete(customer);
    getAll();
  }

  void update(Customer customer) async {
    await _customerRepository.update(customer);
    getAll();
  }

  void create(Customer customer) async {
    await _customerRepository.create(customer);
    getAll();
  }
}
