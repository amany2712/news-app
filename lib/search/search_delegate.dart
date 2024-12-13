import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/app_theme.dart';
import 'package:news/news/news_details.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class NewsSearchDelegate extends SearchDelegate {
  
  @override
  ThemeData appBarTheme(BuildContext context) {
    
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.primary, 
        foregroundColor: Colors.white, 
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white, // Search text color
          fontSize: 18,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white70), // Hint text color
        border: InputBorder.none, // Remove underline border
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = ''; // Clear the query
          showSuggestions(context); // Show suggestions again when query is cleared
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text("Start typing to search for news articles..."),
      );
    }

    return FutureBuilder(
      future:APIService.searchNews(query) , // Fetch news based on query and sourceId
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

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null); // Close search
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // For now, just use buildSuggestions for results as well
    return buildSuggestions(context);
  }
}
