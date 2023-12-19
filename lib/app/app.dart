
import 'package:app/configs/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(AppRouters.provider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: config,
    );
  }
}
