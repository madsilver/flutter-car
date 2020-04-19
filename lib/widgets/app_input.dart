import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppInput(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      keyboardAppearance: Brightness.dark,
      style: TextStyle(color: Colors.blue, fontSize: 25),
      decoration: InputDecoration(
//        border: OutlineInputBorder(
//          borderRadius: BorderRadius.circular(16),
//        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 25,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
