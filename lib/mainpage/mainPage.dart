import 'package:brillo_test/Profilepage/profile_page.dart';
import 'package:brillo_test/buddlespage/buddles_page.dart';
import 'package:brillo_test/constant.dart';
import 'package:brillo_test/homepage/homepage.dart';
import 'package:brillo_test/inbox/inboxpage.dart';
import 'package:brillo_test/providers/page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(pageProvider);

    final List<Widget> pages = [
      const Homepage(),
      const BuddlesPage(),
      const InboxPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(
              8.0), 
          child: SizedBox(
            height: 100, 
            width: 100, 
            child: Image.asset(
              'assets/logot.png',
              fit: BoxFit
                  .contain, 
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_on_outlined)),
              Positioned(
                right: 3,
                top: 2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '+99',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: pages[currentIndex],

      
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors
            .white, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Home Button
            _buildBottomItem(
              context: context,
              icon: Icons.home,
              label: "Home",
              isActive: currentIndex == 0,
              onTap: () => ref.read(pageProvider.notifier).setPage(0),
            ),

            // Buddies Button
            _buildBottomItem(
              context: context,
              icon: Icons.directions,
              label: "Buddies",
              isActive: currentIndex == 1,
              onTap: () => ref.read(pageProvider.notifier).setPage(1),
            ),

            
            GestureDetector(
              onTap: () {
                
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: basicColor, width: 1),
                ),
                child: Icon(Icons.add, size: 25, color: Colors.white,)
              ),
            ),

            // Inbox Button
            _buildBottomItem(
              context: context,
              icon: Icons.message,
              label: "Inbox",
              isActive: currentIndex == 2,
              onTap: () => ref.read(pageProvider.notifier).setPage(2),
            ),

            // Profile Button
            _buildBottomItem(
              context: context,
              icon: Icons.person,
              label: "Profile",
              isActive: currentIndex == 3,
              onTap: () => ref.read(pageProvider.notifier).setPage(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFFE94057) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFFE94057) : Colors.grey,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

