import 'package:flutter/material.dart';
import 'package:news_feed_app/utils/constants.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: mCardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            icon: Icons.search,
            title: 'Search',
            press: () => onItemTap(0),
            isActive: selectedIndex == 0,
          ),
          BottomNavItem(
            icon: Icons.trending_up,
            title: "Trending News",
            press: () => onItemTap(1),
            isActive: selectedIndex == 1,
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? press;
  final bool isActive;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.title,
    this.press,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(icon, color: isActive ? mBackgroundColor : mGreyColor, size: 28),
          Text(
            title,
            style: TextStyle(
              color: mBackgroundColor,
              decoration:
                  isActive ? TextDecoration.underline : TextDecoration.none,
              decorationColor: mBackgroundColor,
              decorationThickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
