import 'package:flutter/material.dart';
import 'package:website/constants/colors.dart';
import 'package:website/constants/size.dart';
import 'package:website/constants/sns_links.dart';
import 'package:website/widgets/custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          //title
          Text(
            "Get in touch ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }
                //else
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          //message bottun
          SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: CustomTextField(hintText: "Your message", maxLines: 20),
          ),
          const SizedBox(height: 16),
          //send button
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Get in touch"),
              ),
            ),
          ),

          SizedBox(height: 30),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Divider(),
          ),
          SizedBox(height: 15),
          //SNS icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod("open", [SnsLinks.github]);
                },
                child: Image.asset("github.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.linkedIn]);
                },
                child: Image.asset("linkedin.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.facebook]);
                },
                child: Image.asset("facebook.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.instagram]);
                },
                child: Image.asset("instagram.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.telegram]);
                },
                child: Image.asset("telegram.png", width: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(child: CustomTextField(hintText: "Your name")),
        SizedBox(width: 15),
        Flexible(child: CustomTextField(hintText: "Your email")),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(child: CustomTextField(hintText: "Your name")),
        SizedBox(height: 15),
        Flexible(child: CustomTextField(hintText: "Your email")),
      ],
    );
  }
}
