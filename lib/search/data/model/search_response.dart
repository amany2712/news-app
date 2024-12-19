
import 'package:news/news/data/models/article.dart';


class SearchResponse {
  final String? status;
  final int? totalResults;
  final List<News>? news;

  const SearchResponse({this.status, this.totalResults, this.news});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      news: (json['articles'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  
}
