import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class TabItem extends StatelessWidget {
 final String sourceName;
 final bool isSelected;
 const TabItem ({super.key, 
  required this.sourceName,
  required this.isSelected,
 });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : Colors.transparent,
        border: Border.all(
          width: 2,
          color: AppTheme.primary
          ),
          borderRadius: const BorderRadius.all(Radius.circular(25))
      ),
      child: Text(
        sourceName,
        style: Theme.of(context).textTheme.titleSmall 
           ?.copyWith(
            color:  isSelected ? AppTheme.white : AppTheme.primary,
            ),
      ),
    );
  }
}