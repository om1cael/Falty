import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatelessWidget {
  final String label;
  final String hint;
  final String suffix;
  final String helper;
  final int length;
  final TextEditingController controller;

  const NumberInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.suffix,
    required this.helper,
    required this.length,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: length,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hint,
            filled: true,
            fillColor: Color(0xffB8B8FF),
            hintStyle: TextStyle(
              color: Colors.white70
            ),
            suffix: Text(
              suffix,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            helper: Text(
              helper,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            counterStyle: TextStyle(
              color: Colors.white
            ),
          ),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}