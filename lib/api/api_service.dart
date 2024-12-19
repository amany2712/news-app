import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/shared/api_constants.dart';
import 'package:news/search/data/model/search_response.dart';
class APIService {
  
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