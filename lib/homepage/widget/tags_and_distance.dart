import 'package:flutter/material.dart';

class TagsAndlocation extends StatelessWidget {
  const TagsAndlocation({
    super.key,
    required this.taggedImages,
  });

  final List<String> taggedImages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey.shade200,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Row(
            children: [
              // Stacked Images
              SizedBox(
                width: (taggedImages.length) * 15.0 +
                    30, // Adjust width to fit text
                height: 24,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: List.generate(
                    taggedImages.length,
                    (index) {
                      return Positioned(
                        left: index * 15.0,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(taggedImages[index]),
                          backgroundColor: Colors.white,
                        ),
                      );
                    },
                  )
                    // Add text on top of the last image
                    ..add(
                      Positioned(
                        left: (taggedImages.length - 0) * 10.0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFE94057)),
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "+2",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFE94057),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFEB692), Color(0xFFE94057)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          child: const Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Color(0xFFE94057),
              ),
              SizedBox(width: 4),
              Text(
                '20 Miles Away',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
