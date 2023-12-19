import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});
  static CustomersScreen builder(BuildContext context, GoRouterState state) =>
      const CustomersScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
