import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = List.generate(
      6,
       (index) => CategoryModel(
        id: 'id', 
        name: 'sport',
         imageName: 'ball',
          color: AppTheme.red
          )
          );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text("Pick your category of interest",
            style: Theme.of(context)
             .textTheme
             .titleLarge
             ?.copyWith(
               color: AppTheme.navy,
                ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                ),
              itemBuilder: (_, index) => CategoryItem(
                index: index,
                category:categories[index] 
                ) ,
              itemCount: categories.length,
              ),
          )
        ],
      ),
    );
  }
}