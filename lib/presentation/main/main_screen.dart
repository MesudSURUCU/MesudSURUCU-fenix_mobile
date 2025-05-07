import 'package:fenix_mobile/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../favorites/favorites_screen.dart';
import '../home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final _screens = const [
    HomeScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: BottomNavigationBar(
            backgroundColor: ColorConstants.white,
            currentIndex: _selectedIndex,
            selectedItemColor: ColorConstants.black,
            unselectedItemColor: ColorConstants.grey,
            onTap: (index) => setState(() => _selectedIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
