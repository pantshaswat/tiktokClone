import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

import 'home.dart';

class feed extends StatefulWidget {
  const feed({super.key});

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  int selectedIndex = 0;
  navBackgroundColor() {
    if (selectedIndex == 0) {
      return Colors.black;
    } else
      return Colors.white;
  }

  unselectedIconColors() {
    if (selectedIndex == 0) {
      return Colors.grey;
    } else
      return Colors.grey;
  }

  selectedIconColor() {
    if (selectedIndex == 0) {
      return Colors.white;
    } else
      return Colors.black;
  }

  onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  late VideoPlayerController controller;
  bool isVideoPause = true;

  final screens = [
    home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: navBackgroundColor(),
          selectedItemColor: selectedIconColor(),
          unselectedItemColor: unselectedIconColors(),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: selectedIndex,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          onTap: onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Discover'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                ),
                label: 'Inbox'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
