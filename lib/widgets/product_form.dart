import 'dart:io';

import 'package:app/data/models/product.dart';
import 'package:app/providers/app_providers.dart';
import 'package:app/utils/app_alerts.dart';
import 'package:app/widgets/common_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProductForm extends ConsumerStatefulWidget {
  const ProductForm({super.key});
  @override
  ConsumerState<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<ProductForm> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  FilePickerResult? filePicker;
  File? file;
  void init() async {
    filePicker = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (filePicker != null) {
      file = File(filePicker!.files.single.path!);
    }
    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(children: [
            CommonTextField(
              title: "Name",
              controller: nameController,
            ),
            const Gap(16),
            CommonTextField(
              title: "Price",
              controller: priceController,
            ),
            const Gap(16),
            if (file != null)
              Image.file(
                file!,
                height: 200,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: init, child: const Text("image")),
                const Gap(40),
                ElevatedButton(
                    onPressed: () async {
                      final name = nameController.text;
                      String price = priceController.text;
                      try {
                        await ref
                            .read(AppProviders.productProvider.notifier)
                            .create(Product(
                                name: name,
                                price: int.parse(price),
                                file: file));
                        AppAlerts.displaySnackbar(
                            context: context, message: "Created successfully!");
                      } catch (e) {
                        AppAlerts.displaySnackbar(
                            context: context,
                            message: "Create failed!",
                            color: Colors.red[500]);
                      }
                      context.pop();
                    },
                    child: const Text("Save"))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
