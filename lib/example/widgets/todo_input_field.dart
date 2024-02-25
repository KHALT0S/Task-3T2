import 'package:flutter/material.dart';

class TodoInputField extends StatelessWidget {
  final bool readonly;
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;

  const TodoInputField({
    required this.label,
    required this.controller,
    this.readonly = false,
    this.maxLines = 1,
    this.onTap,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration().copyWith(hintText: label),
      textAlignVertical: TextAlignVertical.center,
      maxLines: maxLines,
      controller: controller,
      readOnly: readonly,
      onTap: onTap,
      validator: validator,
    );
  }
}
