import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(DrawerItem) onItemSelected;
  const HomeDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextStyle? tittleLargeStyle =
        Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24);
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: screenSize.height * 0.2,
            width: double.infinity,
            color: AppTheme.primary,
            child: Text(
              "News App!",
              style: tittleLargeStyle,
            ),
          ),
          Expanded(
            child: Container(
              color: AppTheme.white,
              padding: const EdgeInsetsDirectional.only(top: 30, start: 12),
              child: Column(children: [
                GestureDetector(
                  onTap: () => onItemSelected(DrawerItem.categories),
                  child: Row(
                    children: [
                      const Icon(Icons.menu),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Categories",
                        style:
                            tittleLargeStyle?.copyWith(color: AppTheme.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () => onItemSelected(DrawerItem.settings),
                  child: Row(
                    children: [
                      const Icon(Icons.settings),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Settings",
                        style:
                            tittleLargeStyle?.copyWith(color: AppTheme.black),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

//Enum//
enum DrawerItem { categories, settings }
