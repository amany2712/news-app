import 'dart:convert';

import 'package:news/news/data/models/news_response.dart';
import 'package:news/shared/api_constants.dart';
import 'package:http/http.dart' as http;


class NewsDataSource {
  Future <NewsResponse> getNews (String sourceId, {int page = 1 , int pageSize = 10}) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.newsEndpoint,
      {
        'apiKey' : APIConstants.apiKey,
        'sources' : sourceId,
         'page' : page.toString(),
        'pageSize' : pageSize.toString(),

      }
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    
    return NewsResponse.fromJson(json);

  }
}