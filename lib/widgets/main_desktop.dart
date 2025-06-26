import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;
import 'package:website/constants/colors.dart';
import 'package:website/constants/sns_links.dart';

final Uri flutterUrl = Uri.parse('https://flutter.dev');

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    debugPrint("Could not launch $url");
    return;
  }
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

class _MainDesktopState extends State<MainDesktop> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isWideScreen = screenSize.width > 600;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: screenSize.height / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 20,
        children: [
          // Left side: Text and Button
          SizedBox(
            width: isWideScreen ? screenSize.width / 2.5 : screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 200),
                const Text(
                  "Hi,\nI'm Batjargal\nA student of Software Engineering",
                  style: TextStyle(
                    fontSize: 30,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      const String instagramUrl = SnsLinks.instagram;

                      if (Platform.isAndroid || Platform.isIOS) {
                        // Launch URL for mobile platforms
                        await _launchUrl(instagramUrl);
                      } else {
                        // Open URL using JS for web or desktop
                        js.context.callMethod('open', [instagramUrl]);
                      }
                    },
                    child: const Text("Find your solution"),
                  ),
                ),
              ],
            ),
          ),
          // Right side: Image
          SizedBox(
            width: isWideScreen ? screenSize.width / 2.5 : screenSize.width,
            child: Transform.translate(
              offset: const Offset(0, -120), // Adjust vertical offset
              child: Image.asset("assets/123.png", fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
