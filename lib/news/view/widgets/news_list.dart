import 'package:flutter/material.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/view/screens/news_details.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList(
    this.sourceId, {
    super.key,
  });

  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  final List<NewsItem> _newsList = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMoreData = true;
  final ScrollController _scrollController = ScrollController();

  Future<void> _fetchNews() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await NewsDataSource().getNews(
        widget.sourceId,
        page: _currentPage,
        pageSize: 10, // Set page size
      );

      setState(() {
        if (response.news!.isNotEmpty) {
          _newsList.addAll(response.news!.map((article) => NewsItem(article)));
          _currentPage++;
        } else {
          _hasMoreData = false; // No more data to fetch
        }
      });
    } catch (e) {
      print('Error fetching news: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchNews();

    

    // Add scroll listener to detect when user scrolls to the bottom
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMoreData) {
        _fetchNews();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
            if (viewModel.isLoading) {
          return const LoadingIndicator();
        } else if (viewModel.errorMessage != null) {
          return  ErrorIndicator(viewModel.errorMessage!);
        } else {
          
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
               if (notification is ScrollUpdateNotification &&
                    notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent - 200 &&
                   !_isLoading &&
                    _hasMoreData) {

                  _fetchNews();
                 }
              return true;
           },
           child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                NewsDetails.routeHome,
                arguments: NewsItem(viewModel.newsList[index]),
                ),
                child: NewsItem(viewModel.newsList[index])
                ),
              itemCount: viewModel.newsList.length + (_isLoading ? 1 : 0),
            ),
          );
        }
            
       }
     
        ),
      );


    //FutureBuilder(
     // future: APIService.getNews(widget.sourceId),
    //  builder: (context, snapshot) {
      //  if (snapshot.connectionState == ConnectionState.waiting) {
       //   return const LoadingIndicator();
       // } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
        //  return const ErrorIndicator();
       // } else {
        //  final newList = snapshot.data?.news ?? [];
          
        //  return NotificationListener<ScrollNotification>(
          //  onNotification: (notification) {
          //     if (notification is ScrollUpdateNotification &&
           //         notification.metrics.pixels >=
           //         notification.metrics.maxScrollExtent - 200 &&
           //        !_isLoading &&
           //         _hasMoreData) {

           //       _fetchNews();
           //      }
           //   return true;
          //  },
          //  child: ListView.builder(
           //   controller: _scrollController,
           //   itemBuilder: (_, index) => GestureDetector(
             //   onTap: () => Navigator.of(context).pushNamed(
             //   NewsDetails.routeHome,
              //  arguments: NewsItem(newList[index]),
              //  ),
              //  child: NewsItem(newList[index])
              //  ),
            //  itemCount: newList.length + (_isLoading ? 1 : 0),
           // ),
        //  );
       // }
     // },
   // );
  }
}
