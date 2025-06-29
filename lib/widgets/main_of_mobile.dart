import 'package:flutter/material.dart';
import 'package:website/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      constraints: const BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  CustomColor.scaffoldBg.withOpacity(0.6),
                  CustomColor.scaffoldBg.withOpacity(0.6),
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              "assets/123.png",
              width: screenWidth,
              height: screenHeight / 1.3,
            ),
          ),
          const SizedBox(height: 5),
          // intro text
          const Text(
            "Hi,\nI'm Batjargal\nA student of Software Engineering",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 180,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Find your solution"),
            ),
          ),
        ],
      ),
    );
  }
}
