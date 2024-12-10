import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/search_response/search_response.dart';
import 'package:news/models/sources_response/sources_response.dart';
class APIService {
  static Future <SourcesResponse> getSources (String categoryId) async {
   final uri = Uri.https(
    APIConstants.baseURL,
    APIConstants.sourcesEndpoint,
    {
      'apiKey' : APIConstants.apiKey,
      'category' : categoryId,
    });
   final response = await http.get(uri);  //get =>Come back to me response
   final json =jsonDecode(response.body);
   return SourcesResponse.fromJson(json);
  }

  static Future <NewsResponse> getNews (String sourceId) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.newsEndpoint,
      {
        'apiKey' : APIConstants.apiKey,
        'sources' : sourceId,

      }
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    
    return NewsResponse.fromJson(json);

  }

  static Future <SearchResponse> searchNews (String query) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.searchEndpoint,
      {
        'apiKey' : APIConstants.apiKey,
        'q' : query,

      }
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);

    return SearchResponse.fromJson(json);
  }



}