import 'package:flutter/material.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';

class SourcesViewModel with ChangeNotifier {
  final dataSource = SourcesDataSource();
  List<Source> sources = [];
  String? errorMessage ;
  bool isLoading = false ;

  Future <void> getSources(String categoryId) async {
    isLoading = true;
     notifyListeners();
    try {
     final response =await dataSource.getSources(categoryId);
     if (response.status == 'ok' && response.sources != null){
       sources = response.sources!;
       }else{
         errorMessage = "faild to get source ";
         }
  } catch(error){
    errorMessage = error.toString();
  }
  isLoading = false ;
  notifyListeners();

  }
}