import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.nameController,
    required this.hintText,
    this.maxlines,
    this.onTap,
  });

  final TextEditingController? nameController;
  final String hintText;
  final int? maxlines;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,

      readOnly: onTap != null,
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      controller: nameController,
      maxLines: maxlines,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade300,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText.tr(),
      ),
    );
  }
}
