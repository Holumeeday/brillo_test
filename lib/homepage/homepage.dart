import 'package:flutter/material.dart';
import 'widget/activities_content_view.dart';
import 'widget/custom_tab.dart';
import 'widget/post_content_view.dart';
import 'widget/stories.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  bool isBookmarked = false;

  final List<String> tabTitles = ["Activities", "Post"];
  final List<Widget> tabContents = [
    const ActivitiesContentView(),
    const PostContentView(),
  ];


  void updateTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stories(),
          CustomTabbar(
            selectedIndex: selectedIndex,
            onTabChanged: updateTab,
          ),
          Expanded(
            child: tabContents[selectedIndex],
          ),
        ],
      ),
    );
  }

  
}




