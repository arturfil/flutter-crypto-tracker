import 'package:flutter/material.dart';

textFormField(TextEditingController txtCtrl, String label, String hint,
    IconData iconData, String initialValue, bool number) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      keyboardType: number ? TextInputType.number : null,
      validator: (value) {
        if (value.isEmpty) {
          return "All fields need to be filled";
        } else {
          return null;
        }
      },
      controller: txtCtrl,
      textCapitalization: TextCapitalization.words,
      style: TextStyle(color: Colors.white, fontSize: 19.0),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff07f2a0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue,
          ),
        ),
        fillColor: Colors.white,
        prefixIcon: Icon(
          iconData,
          color: Colors.white,
        ),
        hintText: label,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      cursorColor: Colors.white,
    ),
  );
}
