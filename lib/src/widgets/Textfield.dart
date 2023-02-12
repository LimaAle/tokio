import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextfield extends StatelessWidget {
  const LoginTextfield({
    super.key,
    this.label,
    this.obscure,
    this.mask,
  });
  final String? label;
  final bool? obscure;
  final TextInputFormatter? mask;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: obscure ?? false,
      inputFormatters: mask != null ? [mask!] : [],
      decoration: InputDecoration(
          label: Center(
            child: Text(
              label ?? "nolabel",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.white))),
    );
  }
}
