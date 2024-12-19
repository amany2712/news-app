import 'package:flutter/material.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/models/article.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();
  List <News> newsList = [];
  bool isLoading = false;
  String ? errorMessage;

  Future getNews (String sourceId) async {
    isLoading = true;
     notifyListeners();
    try{
    final response = await dataSource.getNews(sourceId);
    if (response.status =='ok' && response.news != null){
      newsList = response.news!;
    }else{
      errorMessage = 'failed to get news ';
    }
  }catch(error){
    errorMessage = error.toString();
  }
   isLoading = false ;
  notifyListeners();

  }

}