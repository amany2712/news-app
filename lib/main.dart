import 'package:flutter/material.dart';
import 'package:news/home/view/screens/home_screen.dart';
import 'package:news/news/view/screens/news_details.dart';
import 'package:news/settings/view/widgets/settings.dart';
import 'package:news/shared/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => SettingProvider(),
    child:const NewsApp()
    ));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeHome: (_) => const HomeScreen(),
        NewsDetails.routeHome : (_) => const NewsDetails(),
      },
      initialRoute: HomeScreen.routeHome,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
       localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.languagecode),
    );
  }
}
