import 'package:flutter/material.dart';
import 'package:news_feed_app/utils/constants.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onSearch;

  const SearchAppBar({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mCardColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: mBackgroundColor),
        onPressed: onCancel,
      ),
      title: TextField(
        controller: controller,
        style: const TextStyle(color: mBackgroundColor),
        cursorColor: mBackgroundColor,
        decoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: mBackgroundColor),
          border: InputBorder.none,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: mBackgroundColor),
          onPressed: onSearch,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
