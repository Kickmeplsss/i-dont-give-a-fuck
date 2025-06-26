import 'package:flutter/material.dart';
import 'package:website/constants/colors.dart';
import 'package:website/utils/project_utils.dart';
import 'package:website/widgets/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //work porjects title
          const Text(
            "Work Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          //work projects cards
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCardWidget(project: workProjectUtils[i]),
              ],
            ),
          ),
          SizedBox(height: 80),
          //hobby project
          const Text(
            "Hobby Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          //Hobby projects projects cards
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjectUnils.length; i++)
                  ProjectCardWidget(project: hobbyProjectUnils[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
