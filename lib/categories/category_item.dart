import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final int index;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: const Radius.circular(25),
              topStart: const Radius.circular(25),
              bottomStart: Radius.circular(index.isEven ? 25 : 0),
              bottomEnd: Radius.circular(index.isOdd ? 25 : 0)),
          color: category.color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/${category.imageName}.png'),
          Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
