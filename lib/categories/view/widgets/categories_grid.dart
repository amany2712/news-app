import 'package:flutter/material.dart';
import 'package:news/categories/view/widgets/category_item.dart';
import 'package:news/categories/data/models/category_model.dart';
import 'package:news/shared/app_theme.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.onCategorySelected});

  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final categories = [
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
      const CategoryModel(
        id: 'business',
        name: 'Business',
        imageName: 'business',
        color: Color(0xFFCF7E48),
      ),
      const CategoryModel(
        id: 'health',
        name: 'Health',
        imageName: 'health',
        color: Color(0xFFED1E79),
      ),
      const CategoryModel(
        id: 'general',
        name: 'Politics',
        imageName: 'general',
        color: Color(0xFF003E90),
      ),
      const CategoryModel(
        id: 'entertainment',
        name: 'Enviroment',
        imageName: 'entertainment',
        color: Color(0xFF4882CF),
      ),
      const CategoryModel(
        id: 'science',
        name: 'Science',
        imageName: 'science',
        color: Color(0xFFF2D352),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "Pick your category of interest",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.navy,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (_, index) {
                CategoryModel category = categories[index];
                return GestureDetector(
                  onTap: () {
                    onCategorySelected(category);
                  },
                  child: CategoryItem(index: index, category: category),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
