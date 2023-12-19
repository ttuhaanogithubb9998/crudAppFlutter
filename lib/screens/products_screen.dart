import 'package:app/data/models/models.dart';
import 'package:app/providers/app_providers.dart';
import 'package:app/utils/app_alerts.dart';
import 'package:app/utils/domain.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});
  static ProductsScreen builder(BuildContext context, GoRouterState state) =>
      const ProductsScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> products =
        ref.watch(AppProviders.productProvider).products;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const ProductForm(),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text("Create"),
            )),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Table(
                    border: TableBorder.all(color: Colors.black),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(3),
                      3: FlexColumnWidth(2),
                      4: FlexColumnWidth(2),
                    },
                    children: products
                        .map((product) => TableRow(children: [
                              Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    product.id.toString(),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.network(
                                  "$baseurl${product.image}",
                                  errorBuilder: (ctx, o, p) => Icon(
                                    Icons.error,
                                    color: Colors.red[200],
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    product.name,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    product.price.toString(),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    try {
                                      await ref
                                          .read(AppProviders
                                              .productProvider.notifier)
                                          .delete(product);
                                      AppAlerts.displaySnackbar(
                                          context: context,
                                          message: "deleted successfully!");
                                    } catch (e) {
                                      AppAlerts.displaySnackbar(
                                          context: context,
                                          message: "delete failed!",
                                          color: Colors.red[500]);
                                    }
                                  },
                                ),
                              )
                            ]))
                        .toList(),
                  ),
                  const Gap(30),
                ],
              )),
        ));
  }
}
