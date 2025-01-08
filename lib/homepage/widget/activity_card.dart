import 'package:brillo_test/homepage/widget/reactions.dart';
import 'package:flutter/material.dart';

import 'carousel.dart';
import 'tags_and_distance.dart';

class ActivityCard extends StatefulWidget {
  final String username;
  final String timeAgo;
  final String imagePath;
  final String profileImagePath;

  const ActivityCard({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.imagePath,
    required this.profileImagePath,
  });

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  bool isBookmarked = false;
  final List<String> taggedImages = [
    'assets/person1.png',
    'assets/person2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            CardHearder(),
            TagsAndlocation(taggedImages: taggedImages),
            // carousel Section
            SizedBox(height: 300, child: Carousel()),
            //Reaction
            //   ReactionTab(taggedImages: taggedImages)
            const ReactionWrapper(),
           
          ],
        ),
      ),
    );
  }

  Row CardHearder() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Profile Image
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(widget.profileImagePath),
        ),
        const SizedBox(width: 10),

        // Name, Verified Icon, Time Ago
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                widget.timeAgo,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Image.asset(
              'assets/reply.png',
              width: 20,
              height: 20,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isBookmarked = !isBookmarked;
                });
              },
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                color: isBookmarked ? Colors.orange : Colors.grey,
              ),
            ),
            const Icon(Icons.more_vert),
          ],
        )
      ],
    );
  }
}
