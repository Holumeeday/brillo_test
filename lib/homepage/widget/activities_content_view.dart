import 'package:flutter/material.dart';


import 'activity_card.dart';

class ActivitiesContentView extends StatelessWidget {
  const ActivitiesContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ActivityCard(
            username: 'Gold Daniel',
            timeAgo: '5hrs ago',
            imagePath: 'assets/person4.png',
            profileImagePath: 'assets/person1.png',
          ),
          ActivityCard(
            username: 'Ajayi Olumide',
            timeAgo: '2hrs ago',
            imagePath: 'assets/person2.png',
            profileImagePath: 'assets/person3.png',
          )
        ],
      ),
    );
  }
}
