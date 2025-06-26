import 'package:flutter/material.dart';
import 'package:website/constants/colors.dart';
import 'package:website/constants/size.dart';
import 'package:website/constants/sns_links.dart';
import 'package:website/widgets/contact_section.dart';
import 'package:website/widgets/drawer_mobile.dart';
import 'package:website/widgets/footer.dart';
import 'package:website/widgets/header_desktop.dart';
import 'package:website/widgets/header_mobile.dart';
import 'package:website/widgets/main_desktop.dart';
import 'package:website/widgets/main_of_mobile.dart';
import 'package:website/widgets/project_section.dart';
import 'package:website/widgets/skills_desktop.dart';
import 'package:website/widgets/skills_mobile.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> sectionKeys = List.generate(4, (_) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width >= kMinDesktopWidth;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: isDesktop
              ? null
              : DrawerMobile(
                  onNavItemTap: (int index) {
                    _scrollToSection(index);
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(key: sectionKeys[0]),
                // Header
                if (isDesktop)
                  HeaderDesktop(onNavMenuMap: _scrollToSection)
                else
                  HeaderMobile(
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),

                // Main Section
                isDesktop ? const MainDesktop() : const MainMobile(),

                // Skills Section
                Container(
                  key: sectionKeys[1],
                  width: screenSize.width,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLight1,
                  child: Column(
                    children: [
                      const Text(
                        "What I Can Do",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      isDesktop ? const SkillsDesktop() : const SkillsMobile(),
                    ],
                  ),
                ),

                // Projects Section
                ProjectSection(key: sectionKeys[2]),
                const SizedBox(height: 30),

                // Contact Section
                ContactSection(key: sectionKeys[3]),
                const SizedBox(height: 30),

                // Footer
                const Footer(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _scrollToSection(int index) {
    if (index == 4) {
      // Open the blog page
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }

    final targetKey = sectionKeys[index];
    if (targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }
}
