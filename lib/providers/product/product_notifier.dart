import 'package:app/data/models/models.dart';
import 'package:app/data/repositories/product_repository.dart';
import 'package:app/providers/product/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState(products: [])) {
    getAll();
  }
  final ProductRepository _productRepository = ProductRepository();
  getAll() async {
    state = ProductState(products: await _productRepository.findAll());
  }

  Future<void> delete(Product product) async {
    await _productRepository.delete(product);
    getAll();
  }

  Future<void> update(Product product) async {
    await _productRepository.update(product);
    getAll();
  }

  Future<void> create(Product product) async {
    await _productRepository.create(product);
    await getAll();
    print(state);
  }
}
