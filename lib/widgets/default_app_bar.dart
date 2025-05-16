import 'package:flutter/material.dart';
import 'package:news_feed_app/utils/constants.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSearchTap;
  const DefaultAppBar({super.key, required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'News App',
        style: TextStyle(
          color: mBackgroundColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: mBackgroundColor),
          onPressed: onSearchTap,
        ),
      ],
      backgroundColor: mCardColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
