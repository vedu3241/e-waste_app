import 'package:e_waste_app/screens/rewards_screen.dart';
import 'package:e_waste_app/screens/newHomeScreen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.userId});
  final String userId;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = NewHomeScreen(
      userId: widget.userId,
    );
    // Widget activePage = DemoScreen();

    if (_selectedPageIndex == 1) {
      activePage = RewardsScreen();
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectedPage,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on), label: 'Rewards'),
        ],
      ),
    );
  }
}
