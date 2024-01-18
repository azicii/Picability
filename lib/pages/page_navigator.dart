import 'package:flutter/material.dart';
import 'package:picability/pages/all_chats_page.dart';
import 'package:picability/pages/home_page.dart';
import 'package:picability/pages/notifications_page.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({super.key});

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  final bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.star,
        color: Colors.black,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.notification_important,
        color: Colors.black,),
      label: 'Notifications',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.chat,
        color: Colors.black,),
      label: 'Chat',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: const [
          HomePage(),
          NotificationsPage(),
          AllChatsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: bottomNavigationBarItems,
        //type: BottomNavigationBarType.fixed,
        onTap: (index){
          _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
          );
        },
      ),
    );
  }
}
