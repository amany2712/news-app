import 'package:flutter/material.dart';
import 'package:news/home/view/screens/home_screen.dart';
import 'package:news/news/view/screens/news_details.dart';
import 'package:news/shared/app_theme.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeHome: (_) => const HomeScreen(),
        NewsDetails.routeHome : (_) => const NewsDetails(),
      },
      initialRoute: HomeScreen.routeHome,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
