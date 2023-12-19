import 'package:app/configs/routers/router_location.dart';
import 'package:app/screens/customers_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  const AppRouters._();
  static final GlobalKey<NavigatorState> _navigationKey =
      GlobalKey<NavigatorState>();
  static final _routers = [
    GoRoute(
      path: RouterLocation.home,
      builder: HomeScreen.builder,
      parentNavigatorKey: _navigationKey,
    ),
    GoRoute(
        path: RouterLocation.customers,
        builder: CustomersScreen.builder,
        parentNavigatorKey: _navigationKey),
    GoRoute(
        path: RouterLocation.products,
        builder: ProductsScreen.builder,
        parentNavigatorKey: _navigationKey)
  ];
  static final provider = Provider<GoRouter>((ref) => GoRouter(
      routes: _routers,
      initialLocation: RouterLocation.home,
      navigatorKey: _navigationKey));
}
