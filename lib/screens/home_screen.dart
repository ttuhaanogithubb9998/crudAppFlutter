import 'package:app/data/repositories/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          )),
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push("/customers");
            },
            child: const Text("Customers")),
        ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push("/products");
            },
            child: const Text("Products")),
      ]),
    );
  }
}
