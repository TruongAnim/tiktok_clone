import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/core/helper/assets_helper.dart';
import 'package:tiktok_clone/views/widgets/navigation_bar_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Home screen'),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          navigationBarItem(label: 'Home', image: AssetsHelper.home),
          navigationBarItem(label: 'Search', image: AssetsHelper.search),
          navigationBarItem(label: '', image: AssetsHelper.add),
          navigationBarItem(label: 'Inbox', image: AssetsHelper.inbox),
          navigationBarItem(label: 'Me', image: AssetsHelper.me),
        ],
        currentIndex: pageIndex,
        backgroundColor: backgroundColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
      ),
    );
  }
}
