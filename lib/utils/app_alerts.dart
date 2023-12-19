import 'package:flutter/material.dart';

class AppAlerts {
  const AppAlerts._();
  static bool _active = false;

  static void displaySnackbar(
      {required BuildContext context, required String message, Color? color}) {
    if (!_active) {
      _active = true;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Center(
                child: Text(
              message,
              style: TextStyle(color: color ?? Colors.green[500]),
            )),
            backgroundColor: Colors.amber[50],
          ))
          .closed
          .then((value) => _active = false);
    }
  }
}
