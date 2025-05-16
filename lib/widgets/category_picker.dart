import 'package:flutter/material.dart';
import 'package:news_feed_app/utils/constants.dart';

class CategoryPicker extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;

  const CategoryPicker({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, idx) {
          final cat = categories[idx];
          final isSelected = cat == selected;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () => onSelected(cat),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  isSelected ? mBackgroundColor.withOpacity(0.5) : mCardColor,
                ),
              ),
              child: Text(
                cat,
                style: TextStyle(
                  color: isSelected ? mCardColor : mBackgroundColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
