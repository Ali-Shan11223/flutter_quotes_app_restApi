import 'package:flutter/material.dart';

import 'all_quotes_screen.dart';
import 'favorite_screen.dart';
import 'profile_screen.dart';
import 'random_quote_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const RandomQuoteScreen(),
    const AllQuotesScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              // _pageController.jumpToPage(index);
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.refresh_outlined,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.comment_outlined,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: ''),
          ]),
    );
  }
}
