import 'package:flutter/material.dart';
import 'package:news/categories/view/widgets/category_details.dart';
import 'package:news/categories/view/widgets/categories_grid.dart';
import 'package:news/home/view/widgets/home_drawer.dart';
import 'package:news/categories/data/models/category_model.dart';
import 'package:news/search/view/widgets/search_delegate.dart';
import 'package:news/settings/view/screens/settings_tab.dart';
import 'package:news/shared/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routeHome = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedCategory != null
              ? selectedCategory!.name
              : selectedDrawerItem == DrawerItem.categories
                  ? AppLocalizations.of(context)!.newsApp
                  : AppLocalizations.of(context)!.settings),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,size: 35,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: NewsSearchDelegate(),
                );
              },
            ),
          ],
        ),
        drawer: HomeDrawer(onItemSelected: onDrawerItemSelected),
        body: selectedCategory != null
            ? CategoryDetails(
                selectedCategory!.id,
              )
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingsTab(),
      ),
    );
  }

  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem item) {
    selectedDrawerItem = item;
    selectedCategory = null;

    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
