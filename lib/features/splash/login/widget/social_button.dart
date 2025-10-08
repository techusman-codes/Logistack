import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  const SocialButton({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(icon),
        ),
      ),
    );
  }
}
