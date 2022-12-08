import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.labelName,
      required this.controller,
      this.inputFormatters,
      this.keyboardType,
      this.validator})
      : super(key: key);

  final String labelName;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: TextStyle(
        fontFamily: "Roboto",
        fontSize: 15.sp,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
      ),
      decoration: InputDecoration(labelText: labelName),
    );
  }
}
