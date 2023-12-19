import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    this.hintText,
    this.readOnly = false,
    this.suffixIcon,
    this.maxLines,
    this.controller,
  });
  final String title;
  final String? hintText;
  final bool readOnly;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
        ),
        TextField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          onChanged: (value) {},
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        )
      ],
    );
  }
}
