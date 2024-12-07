import 'package:flutter/material.dart';
import 'package:news/models/source.dart';
import 'package:news/tabs/sources_tabs.dart';

class CategoryDetails extends StatefulWidget {
final String categoryId;

 const CategoryDetails (this.categoryId, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  List <Source> sources = List.generate(
    10, (index) => Source(
      id: '$index',
      name: 'source $index'
      )
      );
  @override
  Widget build(BuildContext context) {
    return SourcesTabs(sources);
  }
}