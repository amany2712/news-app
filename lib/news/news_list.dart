import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/news/news_details.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList(
    this.sourceId, {
    super.key,
  });

  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final newList = snapshot.data?.news ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
              NewsDetails.routeHome,
              arguments: NewsItem(newList[index]),
              ),
              child: NewsItem(newList[index])
              ),
            itemCount: newList.length,
          );
        }
      },
    );
  }
}
