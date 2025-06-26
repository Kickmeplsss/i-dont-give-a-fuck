import 'package:flutter/material.dart';
import 'package:website/constants/colors.dart';

class SideLogo extends StatelessWidget {
  const SideLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        "BK",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          color: CustomColor.yellowSecondary,
        ),
      ),
    );
  }
}
