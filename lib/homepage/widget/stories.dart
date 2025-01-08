import 'package:flutter/material.dart';

class Stories extends StatelessWidget {

   final List<Map<String, String>> stories = [
    {
      'image': 'assets/person1.png',
    },
    {
      'image': 'assets/person2.png',
    },
    {
      'image': 'assets/person3.png',
    },
    {
      'image': 'assets/person4.png',
    },
    {
      'image': 'assets/person5.png',
    },
  ];
   Stories({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF8A2387), 
                            Color(0xFFE94057), 
                            Color(0xFFF27121),
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                    ),
                    Container(
                      width: 65.0,
                      height: 65.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(story['image']!),
                    ),
                    if (index == 0)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFE94057),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
