import 'package:app/providers/customer/customer_notifier.dart';
import 'package:app/providers/customer/customer_state.dart';
import 'package:app/providers/product/product_notifier.dart';
import 'package:app/providers/product/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppProviders {
  const AppProviders._();

  static final customerProvider =
      StateNotifierProvider<CustomerNotifier, CustomerState>(
          (ref) => CustomerNotifier());
  static final productProvider =
      StateNotifierProvider<ProductNotifier, ProductState>(
          (ref) => ProductNotifier());
}
