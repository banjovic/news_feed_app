import 'package:flutter/material.dart';
import 'package:news_feed_app/utils/constants.dart';

class CountryPicker extends StatelessWidget {
  final List<String> countries;
  final String selected;
  final ValueChanged<String> onSelected;
  final Map<String, String> countryNames;

  const CountryPicker({
    super.key,
    required this.countries,
    required this.selected,
    required this.onSelected,
    required this.countryNames,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: countries.length,
        itemBuilder: (ctx, idx) {
          final code = countries[idx];
          final isSelected = code == selected;
          final label = countryNames[code] ?? code.toUpperCase();

          return GestureDetector(
            onTap: () => onSelected(code),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? mCardColor : mGreyColor,
                  decoration:
                      isSelected
                          ? TextDecoration.underline
                          : TextDecoration.none,
                  decorationColor: mCardColor,
                  decorationThickness: 2,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
