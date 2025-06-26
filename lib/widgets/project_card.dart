import 'package:flutter/material.dart';
import 'package:website/constants/colors.dart';

import 'package:website/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});
  final ProjectUtils project;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        children: [
          Image.asset(
            project.image,
            height: 140,
            width: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: TextStyle(fontSize: 12, color: CustomColor.whiteSecondary),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Text(
                  "available on:",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                if (project.androidLing != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.androidLing]);
                    },
                    child: Image.asset("assets/mobile.png", width: 17),
                  ),
                if (project.iosLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.iosLink]);
                      },
                      child: Image.asset("assets/apple.png", width: 17),
                    ),
                  ),
                if (project.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.webLink]);
                      },
                      child: Image.asset("assets/web.png", width: 17),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
