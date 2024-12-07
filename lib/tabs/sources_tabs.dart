import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/source.dart';
import 'package:news/news/news_list.dart';
import 'package:news/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
final List <Source> sources ;
 const SourcesTabs (this.sources, {super.key});

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {

  int selectedTabIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(onTap: (index) {
            selectedTabIndex = index;
            setState(() {});
          },
            isScrollable: true,
            labelColor: AppTheme.black,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.sources
               .map((source) => TabItem(
                sourceName: source.name,
                isSelected: widget.sources.indexOf(source) == selectedTabIndex ,
                ))
               .toList()
            ),
        ),
        const Expanded(
          child: NewsList(),
          )
      ],
    );
  }
}