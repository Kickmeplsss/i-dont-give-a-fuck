import 'package:flutter/material.dart';
import 'package:website/constants/colors.dart';
import 'package:website/constants/nav_items.dart';
import 'package:website/styles/style.dart';
import 'package:website/widgets/side_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuMap});

  final Function(int) onNavMenuMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: kHederDecoration,
      child: Row(
        children: [
          SideLogo(onTap: () {}),
          const Spacer(),
          for (int i = 0; i < navItems.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () => onNavMenuMap(i),
                child: Text(
                  navItems[i],
                  style: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
