import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant.dart';


class ReactionTab extends StatelessWidget {
  const ReactionTab({
    super.key,
    required this.taggedImages,
    required this.onTabClick,
    required this.selectedReaction,
  });

  final List<String> taggedImages;
  final VoidCallback onTabClick;
  final String selectedReaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: Colors.blue, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.handshake, color: Colors.yellow, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.favorite, color: Colors.red, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "18.6k",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '4.7k Shares',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            ),
            GestureDetector(
              onTap: onTabClick,
              child: selectedReaction == "assets/like.png"
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 50, 
                        height: 50, 
                        color: basicColor.withOpacity(.3), 
                        padding: const EdgeInsets.all(
                            8), 
                        child: Image.asset(
                          selectedReaction, 
                          width: 30,
                          height: 30,
                        ),
                      ),
                    )
                  : Image.asset(
                      selectedReaction, 
                      width: 30,
                      height: 30,
                    ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "Buddies attending",
                    style: TextStyle(fontSize: 12, color: Colors.black38),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade200,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    children: [
                    
                      SizedBox(
                        width: (taggedImages.length) * 15.0 +
                            30, 
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
                                      gradient: primaryColor,
                                        border: Border.all(
                                            color: basicColor),
                                        borderRadius: BorderRadius.circular(50)),
                                    child: const Text(
                                      "+2",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: basicColor,
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
              ],
            ),
          ],
        ),

         const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/comment.png',
                        width: 20,
                        height: 20,
                      ),
                      const Text("30")
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/qa.png',
                        width: 20,
                        height: 20,
                      ),
                      const Text("11")
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/user.png',
                        width: 20,
                        height: 20,
                      ),
                      const Text("247")
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/star.png',
                        width: 20,
                        height: 20,
                      ),
                      const Text("14k")
                    ],
                  ),
          
                ],
              ),
          
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: basicColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: basicColor,
                    width: 1
                  )
                ),
                child: const Icon(Icons.chevron_right, color: basicColor,),
              )
            ],
          ),
        )

      ],
    );
  }
}

class ReactionWrapper extends ConsumerStatefulWidget {
  const ReactionWrapper({super.key});

  @override
  ConsumerState<ReactionWrapper> createState() => _ReactionWrapperState();
}

class _ReactionWrapperState extends ConsumerState<ReactionWrapper> {
  final List<String> taggedImages = [
    'assets/person1.png',
    'assets/person2.png',
  ];

  final isSelectingReaction = StateProvider.autoDispose((ref) => false);
  final selectedReaction = StateProvider((ref) => 'assets/like.png');

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (ref.watch(isSelectingReaction)) {
        return ReactionsSelectionTabComponent(
          reactions: reactions,
          onSelect: (value) {
            ref.read(selectedReaction.notifier).state = value;
            ref.read(isSelectingReaction.notifier).state = false;
          },
        );
      } else {
        return ReactionTab(
          selectedReaction: ref.watch(selectedReaction),
          taggedImages: taggedImages,
          onTabClick: () {
            ref.read(isSelectingReaction.notifier).state = true;
          },
        );
      }
    });
  }
}

class ReactionsSelectionTabComponent extends StatelessWidget {
  const ReactionsSelectionTabComponent({
    super.key,
    required this.reactions,
    required this.onSelect,
  });

  final List<String> reactions;
  final Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            reactions.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  onSelect(reactions[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Image.asset(
                    width: 30,
                    height: 30,
                    reactions[index],
                    
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



final List<String> reactions = [
  
  'assets/emojis/first.gif',
  'assets/emojis/thumbs.gif',
  'assets/emojis/512(5).gif',
  'assets/emojis/love.gif',
  'assets/emojis/100.gif',
  'assets/emojis/512(10).gif',
  'assets/emojis/face1.gif',
  'assets/emojis/face2.gif',
  'assets/emojis/face3.gif',
  'assets/emojis/face4.gif',
  'assets/emojis/face5.gif',
  'assets/emojis/face6.gif',
  'assets/emojis/face7.gif',
  'assets/emojis/face8.gif',
  'assets/emojis/face9.gif',
  'assets/emojis/face10.gif',
  'assets/emojis/face11.gif',
  'assets/emojis/face12.gif',
  'assets/emojis/face13.gif',
];
